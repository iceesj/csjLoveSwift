//
//  Generics.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
//泛型
class Generics: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "泛型"
        genericsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func genericsMethod(){
        println("----泛型----")
        
        //泛型是为了解决在针对不同数据类型，而做了同一种功能操作导致的每个类型都要写一份代码的问题。有了泛型，我们可以只写一份逻辑代码，而适应于不同的数据类型。
        
        //泛型一阶段
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, b: &anotherInt)
        println("someInt is now \(someInt),and anotherInt is now \(anotherInt)")
        
        //泛型二阶段
        var someIntTwo = 3
        var anotherIntTwo = 107
        swapTwoValues(&someInt, b: &anotherInt)
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, b: &anotherString)
        
        //泛型类型，Generic Types
        //除了通用的函数，swift使您能够定义自己的泛型类型。这些可以是定制类，结构，枚举，数组和字典等
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        
        let fromTheTop = stackOfStrings.pop()
        
        //扩展一个泛型类型，Extending a Generic Type
        if let topItem = stackOfStrings.topItem{
            println("The top item on the stack is \(topItem).")
        }
        
        
        //类型约束
        let strings = ["cat","dog","llama","parakeet","terrapin"]
        if let foundIndex = findStringIndex(strings, valueToFind: "llama"){
            println("The index of llama is \(foundIndex)")
        }
        let doubleIndex = findIndex([3.14159, 0.1, 0.25], valueToFind:9.3)
        let stringIndex = findIndex(["Mike","Malcolm","Andrea"], valueToFind:"Andrea")
        
        
        //where语句
//        whereMethod()
    }
    
    /*
    func whereMethod(){
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        
        var arrayOfStrings = ["uno","dos","tres"]
        if allItemsMatch(stackOfStrings, arrayOfStrings){
            println("All items match.")
        }else{
            println("Not all item match")
        }
    }
    */
    
    //泛型一阶段
    //交换2个数的值，The Problem That Generics Solve
    //inout作为函数声明时，引用传值的关键字
    func swapTwoInts(inout a: Int, inout b: Int){
        let temporaryA = a //声明常量temporaryA 等于 a 的值
        a = b //a 等于 b 的值
        b = temporaryA//b 等于 a的常量值
    }
    
    func swapTwoStrings(inout a: String, inout b: String){
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoDoubles(inout a: Double, inout b: Double){
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //泛型二阶段
    func swapTwoValues<T> (inout a: T, inout b: T){
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    
    //类型约束，Type Constraints
    func findStringIndex(array: [String], valueToFind: String) -> Int? {
        for (index, value) in enumerate(array){
            if value == valueToFind{
                return index
            }
        }
        return nil
    }
    
    
    //if use
    //func findIndex <T> (array: [T], valueToFind: T) -> Int? {
    //Error:'T' is not convertible to 'MirrorDisposition'
    func findIndex <T: Equatable> (array: [T], valueToFind: T) -> Int? {
        for (index, value) in enumerate(array) {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
    
}

//泛型类型，Generic Types
//mutating关键词用于标示这个方法会修改结构
struct intStack{
    var items = [Int]()
    mutating func push(item: Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
}
struct Stack<T>{
    var items = [T]()
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop() -> T{
        return items.removeLast()
    }
    
}

extension Stack{
    var topItem: T? {
        return items.isEmpty ? nil : items [items.count-1]
    }
}

//关联类型，Associated Types
protocol Container{
    //typealias 定义了一个关联类型 ItemType和三个要去，1，一个append方法。2，一个count属性。3，一个下标
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType {get}
    
}
struct IntStack: Container {
    var items = [Int]()
    mutating func push(item: Int){
        items.append(item)
    }
    mutating func pop() -> Int{
        return items.removeLast()
    }
    
    //protocol
    typealias ItemType = Int
    //因为swift会自动推导类型的，所以这里的typealias ItemType ＝ Int其实可以省略。
    mutating func append(item: Int) {
        self.push(item)
    }
    var count: Int{
        return items.count
    }
    subscript (i: Int) -> Int{
        return items[i]
    }
    
}

//扩展现有类型，指定一个关联的类型
//如果我们需要让一个已经存在的类也符合这个关联类型，而这个类又恰好已经遵循了这个协议，就可以留一个空扩展，让它满足的我们的需求:
extension Array: Container {} //这样就可以将任何Array当作是Container来使用了


//Where语句
//写在泛型的类型参数列表中，以约束两个以上的类型，据有某些共同特质，才可以传入allItemsMatch这个函数

//C1,C2 是2个参数类型，他们都遵循Container约束
//C1的ItemType与C2的ItemType必须相同，并且C1的ItemType是遵循Equatable协议的。
//即C2的ItemType与C1的ItemType必须相同，所以这里不必单独写个C2的ItemType也符合Equatable
func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, anotherContainer: C2) -> Bool{
    if someContainer.count != anotherContainer.count{
        return false
    }
    
    //check each pair of items to see if they are equivalent
    for i in 0..<someContainer.count{
        if someContainer[i] != anotherContainer[i]{
            return false
        }
    }
    //all items match, so return true
    return true
}



