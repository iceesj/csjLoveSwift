//
//  Function.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-9.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//函数
class Function: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "函数"

        function()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func function(){
//        func 函数名(参数名字:参数类型)->返回值类型{//多个参数用","分离
//        }
        func myFunc(someBody:String, saySomethring:String)->String{
             return someBody + "say" + saySomethring
        }
        
        //无参函数
        func wucanHanshu()->String{
            return "你好"
        }
        
        //无返回值函数
        func wufanhuiZhi(){
            
        }
        
        //多返回值函数 带返回函数名
        func myCompare(firstNum:Int, secondNum: Int) -> (bigger: Int ,smaller: Int){
            if firstNum >= secondNum{
                return (firstNum , secondNum)
            }else{
                return (secondNum, firstNum)
            }
        }
        let myRet = myCompare(5, 3)
        println("大的为 ＝ \(myRet.bigger)")
        println("小的为 ＝ \(myRet.smaller)")
        
        
        //多返回值函数 不带函数名
        func myNewCompare(firstNum:Int, secondNum:Int) -> (Int,Int){
            if firstNum >= secondNum {
                return (firstNum, secondNum)
            }else{
                return (secondNum, firstNum)
            }
        }
        let myNewRet = myNewCompare(5, 3)
        println("New大的为 ＝ \(myNewRet.0)")
        println("New小的为 = \(myNewRet.1)")
        
        
        //external parameter names(外部使用参数名) - strParam
        func myNewFunc(strParam str:String)->String {
            return "hello" + str //str是在函数内部使用的参数名
        }
        println(myNewFunc(strParam: "kitty"))
        
        
        //外部调用和函数体内部都使用同样参数名
        func mySameFunc (#strParam : String) -> String{
            return "hello" + strParam
        }
        println(mySameFunc(strParam:"world"))
        
        
        //参数的默认值 规定放在最后一个参数
        func myJoin(string1:String, string2:String, withJoiner joiner:String = "+")->String{
            return  string1+joiner+string2
        }
        println(myJoin("hello","world"))
        println(myJoin("hello","world",withJoiner:"=.="))
        
        //变长参数 一个函数最多只能有一个变长的参数，且在参数列表最后
        func arithmeticMean (numbers: Double...) -> Double{
            var total: Double = 0
            //累加所有传入Double参数
            for number in numbers{
                total += number
            }
            return total / Double(numbers.count)//总和/num的个数（5个，3个） ＝ 返回值（）
        }
        arithmeticMean(1,2,3,4,5)
        arithmeticMean(3,8,19)
        
        
        //传入参数 当作 函数体内部变量
        func myVarFunc(var myParam:Int){
            while myParam > 0{
                println("myParam \(myParam)")
                --myParam
            }
        }
        println(myVarFunc(2))//myParam 2, myParam 1
        
        
        //in-out参数
        var myArray = [1,2,3]
        //在参数前面使用inout关键表面，ary参数是in-out参数
        func myArrayFunc (inout ary:Array<Int>){
            ary[1]=8
        }
        myArrayFunc(&myArray)//添加& 表明参数是in-out参数 会在函数内部被改变
        println("myArray = \(myArray)")//1,8,3
        
        
        //      (String)->String
        //      这个类型的函数，他有一个String类型的参数，返回一个String类型值
        var myFuncType : (Int,Int)->Int = myLeixingFunc
        println("结果 ＝ \(myFuncType(2,3))")
        func myFuncFunc(myFuncType:(Int,Int)->Int, a:Int, b:Int){
            println("myFuncFunc结果 = \(myFuncType(a,b))")
        }
        println(myFuncFunc(myLeixingFunc,3,5))
        
        
        //Function Types as Return Types - NO.1
        func myNewLeixingFunc() -> (Int,Int)->Int{
            //xcode6 beta6 - Cannot reference a local function from another local function
            return myLeixingFunc
        }
        let myFanhuiTempFunc = myNewLeixingFunc()
        myFanhuiTempFunc(3,5)
//        myNewLeixingFunc()(3,5)//同上
        
        func chooseStepFunction(backwards: Bool) -> (Int)->Int{
            //xcode6 beta6 - Cannot reference a local function from another local function
            return backwards ? setpBackward : setpForward
        }
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(currentValue>0)
        println("Counting to zero:")
        while currentValue != 0 {
            println("\(currentValue)...")
            currentValue = moveNearerToZero(currentValue)
        }
        println("zero!")
        
        
        //nested func
        func newChooseStepFunction(backwards: Bool) -> (Int)->Int{
            func stepForward(input:Int) -> Int{
                return input + 1
            }
            func stepBackward(input:Int) -> Int{
                return input - 1
            }
            return backwards ? stepBackward : stepForward
        }
        
        var newCurrentValue = -4
        let newMoveNearerToZero = newChooseStepFunction(currentValue>0)
        while newCurrentValue != 0 {
            println("\(newCurrentValue)...")
            newCurrentValue = newMoveNearerToZero(newCurrentValue)
        }
        println("zero!")
        
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

//Function Types as Return Types - NO.2
func setpForward(input:Int) -> Int{
    return input+1
}
func setpBackward(input:Int) -> Int{
    return input-1
}
//Function Types as Parameter Types
func myLeixingFunc(a:Int,b:Int)->Int{
    return a + b
}