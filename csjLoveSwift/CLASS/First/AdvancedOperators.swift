//
//  AdvancedOperators.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//高级运算符
class AdvancedOperators: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "高级运算符"
        advancedOperatorsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func advancedOperatorsMethod(){
        println("----高级运算符----")
        
        //按位运算符，Bitwise Operators
        //按位取反： ~  ,按位与运算：& ,按位或运算：|
        //按位异或运算：^ ,按位左移运算： << ,按位右移动运算： >>
        
        //溢出运算符
        //自从swift里面提供了类型安全之后，就不能再用一个Int.max进行+1操作。
        //swift又提供了一个让我们知道会溢出，继续+1的运算符
        //溢出加法 &+ ,减 &- ,乘 &* ,除 &/,余 &%
        //如果一个数被0除，会产生错误，在swift中，溢出除法 &% 被0除的话，就不会产生错误，得到0值。
        var potentialOverflow = Int16.max
        //potentialOverflow = 32767, which is the largest value an Int16 can hold
        potentialOverflow &+ 1
        
//        var a = Int.max /0 //报错
        //删除 &/
//        var b = Int.max &/ 0
        
        var willOverflow = UInt8.max
        willOverflow = willOverflow &+ 1
        // willOverflow is now equal to 0
        
        var willUnderflow = UInt8.min
        willUnderflow = willUnderflow &- 1
        //10000000
        //willUnderflow is now equal to 255
        
        var signedUnderflow = Int8.min
        //signedUnderflow equals -128,which is the smallest value an Int8 can hold
        signedUnderflow = signedUnderflow &- 1
        //signedUnderflow is now equal to 127
        
        
        //除零，Division by Zero
        let x = 1
        //20150603 删除 &/
//        let y = x &/ 0//y is equal to 0
        
        //优先级和结合性，Precedence and Associativity
        var PandA = 2 + 3 * 4 % 5
        //2 plus 3 = 5, 5 * 4 = 20, 20 % 5 = 0  <-- idiot
        //3 * 4 = 12, 12 % 5 = 2 , 2 + 2 = 4 <-- Good job
        print("PandA = \(PandA)")
        
        
        //运算符func，Operator Functions
        let vector = Vector2D(x: 3.0, y: 1.0)
        let anotherVector = Vector2D(x: 2.0, y: 4.0)
        let combinedVector = vector + anotherVector
        println("combinedVector = \(combinedVector)")
        
        //前缀和后缀运算符，prefix and postfix operators
        let positive = Vector2D(x: 3.0, y: 4.0)
        //负
        let negative = -positive
        println("negative = \(negative)")
        //nagative is a Vector2D instance with values of (-3.0, -4.0)
        let alsoPositive = -negative
        println("alsoPositive = \(alsoPositive)")
        
        
        //复合赋值操作符，Compound Assignment Operators
        var original = Vector2D(x: 1.0, y: 2.0)
        let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
        original += vectorToAdd
        println("originalAddvectorToAdd = \(original += vectorToAdd)")
        
        var toIncrement = Vector2D(x: 3.0, y: 4.0)
        let afterIncrement = ++toIncrement//各+1
        println("afterIncrement = \(afterIncrement)")
        
        
        //等价运算，Equivalence Operators
        let twoThree = Vector2D(x: 2.0, y: 3.0)
        let anotherTwoThree = Vector2D(x: 2.0, y:3.0)
        if twoThree == anotherTwoThree {
            println("These two vectors are equivalent")
        }
        
        //自定义运算符，Custom Operators
        var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
        //翻倍后
//        let afterDoubling ＝ +++toBeDoubled
        println("翻倍后的toBeDoubled (Vector2D) = \(+++toBeDoubled)")
        
        
        //自定义中置运算符的结合性和优先级，Precedence and Associativity for Custom Infix Operators
        let firstVector = Vector2D(x: 1.0, y: 2.0)
        let secondVector = Vector2D(x: 3.0, y: 4.0)
        //增加减去vector
        let plusMinusVector = firstVector +- secondVector
        println("plusMinusVector = \(plusMinusVector)")
        
    }
    

}

//运算符func，Operator Functions
struct Vector2D {
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

//前缀和后缀运算符，prefix and postfix operators
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

//复合赋值操作符，Compound Assignment Operators
func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}

prefix func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1.0, y: 1.0)
    return vector
}

//等价运算，Equivalence Operators
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

//自定义运算符，Custom Operators
//定义了一个前置运算符 +++，定义运算符关键字operator
prefix operator +++ {}

prefix func +++  (inout vector: Vector2D) -> Vector2D{
    vector += vector
    return vector
}

//自定义中置运算符的结合性和优先级，Precedence and Associativity for Custom Infix Operators
infix operator +- {associativity left precedence 140}
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

