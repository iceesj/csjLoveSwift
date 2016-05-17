//
//  Closures_New.swift
//  csjLoveSwift
//
//  Created by tom on 16/5/17.
//  Copyright © 2016年 iceesj. All rights reserved.
//

import UIKit

class Closures_New: UIViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //基础
        self.jichu()
        
        //进阶
        self.jinjie1()
        self.jinjie2()
        
        
    }
    
    
    func jinjie2() {
        func fomeFunctionThatTakesAClosure(closure: () -> () ){
            //函数主题部分
        }
        
        //创建字典
//        let digitNames = [0:"Zero",1:"One",2:"Two",3:"Three",4:"Four"]
        
    }
    
    func jinjie1() {
        //判断数组中是否有大于500元素
        let array = [20,80,100,50,20]
        let v1 = copare(array, 500,{ (num, value) -> Bool in
            return num > value
        })
        if v1==true{
            print("数组array中有比500大的元素")
        }else{
            print("数组array中没有比500大的元素")
        }
        
        //使用闭包判断是否在数组中有大于40的元素
        /*
         let v2 = copare(array, 40) { (num, value) -> Bool in
         return num > value
         }
         */
        //(1)由于Swift是可以推断其参数和返回值的类型，所以->和围绕在参数周围括号可以省略
        /*
         let v2 = copare(array, 40, { (num, value) -> Bool in
         return num > value
         })
         */
        //(2)省略return
        /*
         let v2 = copare(array, 40, { (num, value) in
         num > value
         })
         */
        //(3)简写参数名，省略in
        /*
         let v2 = copare(array, 40, {
         $0 > $1
         })
         */
        //(4)写在一行
        //        let v2 = copare(array, 40,{$0 > $1})
        //(5)运算符函数
        let v2 = copare(array, 40, >)
        
        if v2==true{
            print("数组array中有比40大的元素")
        }else{
            print("数组array中没有比40大的元素")
        }
    }

    func jichu(){
        //无参数的闭包表达式
        let printStr = { () in
            print("Swift")
        }
        printStr()
        
        //带参数的闭包表达式
        let add = { (s1: Int, s2: Int) -> Int in
            let sum = s1+s2
            return sum
        }
        print("add = \(add(10,20))")
        let delete = { (s1: Int, s2 : Int) -> Int in
            let summ = s1-s2
            return summ
        }
        print("delete = \(delete(20,10))")
    }
    
    //闭包表达式最长的用于其他的函数中，并不是单独去使用
    func copare(arr:[Int] , _ value: Int, _ cb:(Num:Int, Value:Int)->Bool) -> Bool{
        for item in arr{
            //判断闭包是否为真
            if (cb(Num: item, Value: value)){
                return true
            }
        }
        return false
    }

    
    

}
