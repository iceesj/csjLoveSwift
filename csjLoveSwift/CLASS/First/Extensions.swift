//
//  Extensions.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//扩展
class Extensions: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "扩展"
        extensionsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func extensionsMethod(){
        println("----扩展----")
        
        //扩展可以让我们给一个已有的类，结构体，枚举等类型添加新功能
        //包括属性和方法，甚至是构造器，下标，支持协议等等
        
        
        //语法
        /*
        extension SomeType{
            //要扩展的属性，方法，等功能
        }
        extension SomeTpye : SomeProtocol {
            //要扩展的属性，方法，等功能
        }
        */
        
        //Extensions in Swift can:
        //添加计算型属性和计算型静态属性
        //定义实例方法和类方法
        //提供新的构造器
        //定义下标
        //定义和使用新的嵌套类型
        //使一个已有的类型遵守某个协议
        

        
        let oneInch = 25.4.mm
        println("One inch is \(oneInch) meters")
        // prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        println("Three feet is \(threeFeet) meters")
        // prints "Three feet is 0.914399970739201 meters"
        let aMarathon = 42.km + 195.m
        println("A marathon is \(aMarathon) meters long")
        // prints "A marathon is 42195.0 meters long"
        
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

//扩展
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

extension Int {
    func toString() -> String{
        var tmpArray = ["0","1","2","3","4","5","6","7","8","9"]
        var tmpNum = self
        var tmpString = ""
        while tmpNum > 0 {
            tmpString = tmpArray[tmpNum % 10] + tmpString
            tmpNum /= 10
        }
        return tmpString
    }
}
