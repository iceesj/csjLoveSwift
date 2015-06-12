//
//  Closures.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//闭包
class Closures: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "闭包"

        closuresMethod()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func closuresMethod() {
        print("----闭包----")
        //Function中的全局函数和嵌套函数，全是闭包的特殊形式
        //所谓闭包表达式，就是一个不带函数名的嵌套函数，书写方式比较特别
        //Global functions are closures that have a name and do not capture any values.
//        Nested functions are closures that have a name and can capture values from their enclosing function.
//        Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
        //闭包的“优化”包含：
        //能够根据上下文推理出来的参数 以及函数的返回值类型
        //return关键字
        //变量名
        //Trailing closure syntax
        let names = ["Chris","Alex","Ewa","Barry","Daniella"]
        func backwards(s1:String, s2:String) -> Bool {
            return s1 > s2
        }
//        var reversed = sorted(names, backwards)
//        print("reversed is equal to \(reversed)")
        
//        Closure Expression Syntax
//        {
//            (参数)->返回值类型 in 函数体
//        }
//        reversed = sorted(names, { (s1:String, s2:String) -> Bool in return s1 > s2})
        //Inferring Type From Context
//        reversed = sorted(names, {s1, s2 in return s1>s2})
        //Implicit Returns from Single-Expression Closures 从闭包隐士返回
        //xcode6 beta6 bug?
//        reversed = sorted(names, {s1, s2 in s1 > s2})
        //Shorthand Argument Names，对于inline的闭包
        //xcode6 beta6 bug?
//        reversed = sorted(names, {$0 > $1})
        //Operator Functions
//        reversed = sorted(names, >)
        
        
        //Trailing Closures
        func someFunctionThatTakesAClosure(closure:() -> () ){
            //func body goes here
        }
        // here's how you call this function without using a trailing closure:
        someFunctionThatTakesAClosure({
            //空闭包 {}
        })
        someFunctionThatTakesAClosure(){}//如果闭包{} 内容很长，我们可以吧{}放在()的外面
        
        //reversed还可以这样写
        //xcode6 beta6 bug?
//        reversed = sorted(names){$0 > $1}
        
        let digitNames = [0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
        let numbers = [16,58,510]
        let strings = numbers.map(){
            //参数number 返回值String in后函数体
            (var number) -> String in
            var output = ""
            while number > 0{
                //16大于0 58, 510
                output = digitNames[number % 10]! + output
                print("output = \(output)")
                number /= 10 // = 1, = 5, = 51, = 5
            }
            return output
        }
        //string is inferred to be of type [String]
        //["OneSix", "FiveEight", "FiveOneZero"]:
        
        //获取值，Capturing Values
        //闭包可以捕捉并保存它的外层函数的常量和变量
        func makeIncrementor(forIncrement amount:Int)-> ()->Int {//返回一个函数
            var runningTotal = 0
            func incrementor ()-> Int {
                runningTotal += amount
                print("return a value of \(runningTotal)")
                return runningTotal
            }
            return incrementor
        }
        //incrementor是一个嵌套函数，返回一个Int，它没有传入参数，而是使用makeIncrementor函数定义的一个runningTotal局部变量，当makeIncrementor，返回incrementor函数时，实际上返回了incrementor函数的一个复制出来的实体函数名，每次调用makeIncrementor的时候都会复制一个新的incrementor函数，正因为闭包可以保存它外层函数定义的常量和变量，所以当外层函数的作用域已不存在的时候，它依然可以使用那个常量或变量的值
        let incrementByTen = makeIncrementor(forIncrement: 10)
        incrementByTen()//10
        incrementByTen()//20
        
        //闭包是引用类型，Closures Are Reference Types
        let alsoIncrementByTen = incrementByTen
        alsoIncrementByTen()//30
        //没有调用makeIncrementor去复制一个新的函数，而是定义了一个常量alsoIncrementByTen被赋值成了incrementByTen
        //正因为闭包是引用类型，alsoIncrementByTen就是incrementByTen之前复制出来的函数的新引用而已。
        
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
