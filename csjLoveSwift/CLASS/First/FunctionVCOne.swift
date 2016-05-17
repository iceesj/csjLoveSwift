//
//  FunctionVCOne.swift
//  csjLoveSwift
//
//  Created by tom on 16/5/16.
//  Copyright © 2016年 iceesj. All rights reserved.
//

import UIKit

class FunctionVCOne: UIViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "函数的返回值"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        print(maxvalue(5, 1, "Hello", "Swift"))
        
        printresult(add, a: 3, b: 2)
        printresult(multiply, a: 3, b: 2)
        
        let f1Int = self.f1(4)
        print("f1Int = \(f1Int)")
        
        
        var sum = 0
        for i in 1...5 {
            print("factorial返回结果=\(factorial(i))")
            sum = sum+factorial(i)
            print("sum = \(sum)")
        }
        print("sum = \(sum)")
        
        
        
    }
    
    
    func maxvalue(value1:Int, _ value2:Int, _ value3: String, _ value4:String) -> (Int, String){
        var maxInt = 0
        var maxString:String
        
        //判断2个整数哪个最大
        if (value1<value2){
            maxInt = value2
        }else{
            maxInt = value1
        }
        
        if (value3<value4){
            maxString = value4
        }else{
            maxString = value3
        }
        
        return (maxInt, maxString)
        
    }
    //相加
    func add(a: Int , b:Int) -> Int {
        return a+b
    }
    //相乘
    func multiply(a:Int, b: Int) -> Int{
        return a*b
    }
    //相除
    func Divided(a: Int, b: Int) -> Int{
        return a/b
    }
    //输出函数
    func printresult(fun:(Int,Int)->Int, a: Int, b:Int){
        print(fun(a,b))
    }
    
    
    //MARK:通过给定的值，输出一系列的值
    func setpForward(input: Int) -> Int{
        return input + 1
    }
    //返回一个比输入值小1得值
    func setpBackward(input : Int) -> Int{
        return input - 1
    }
    //选择返回哪个函数，返回方法
    func chooseStepFunction(backwards : Bool) -> (Int) -> Int{
        return backwards ? setpBackward : setpForward
    }
    
    
    //MARK:函数嵌套
    func f1(q: Int) -> Int {
        var c : Int = 1
        for i in 1...q{//1...4
            //4=4*1
            print("c1=\(c)")
            c=c*i
            print("c2=\(c)")
        }
        return c//获取阶乘的值
    }
    
    func f2(p:Int) -> Int {
        var k : Int
        var r : Int
        k = p*p//求平方
        print("k = \(k)")
        r=f1(k)
        return r//获取平方后 阶乘的值
    }
    
    //MARK:递归调用
    func factorial(value : Int) -> Int {
        if (value == 1) {
            return value
        }else{
            return value * factorial(value-1)
        }
    }
    
    
}
