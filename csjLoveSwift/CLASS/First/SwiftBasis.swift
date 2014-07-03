//
//  SwiftBasis.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class SwiftBasis: CSJSwiftViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "基础"
        
        firstBiji()
        optionalBiji()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func optionalBiji(){
        //可选项optional
        let myNumber = "123"
        myNumber.toInt()
        let myNumber1 = "Hello kitty"
        myNumber1.toInt()
        //不能编译，crash!!! fatal error: Can't unwrap Optional.None
        //        println("myNumber1's value is \(myNumber1.toInt()!)")
        //可以编译，no crash
        println("myNumber's value is \(myNumber.toInt()!)")
        //可这样使用
        if let myActualNumber = myNumber1.toInt(){
            println("myNumber1's value is \(myActualNumber)")
        }else{
            println("myNumber1 could not be converted to an integer")
        }
        
        
        var strValue : Optional<String> = "nicai"
        var strValue1 :String? = "nicai1" //效果同上
        if strValue {
            NSLog("strValue 有值")
        }else{
            NSLog("strValue 无值")// strValue = nil
        }
        println("strValue = \(strValue)")
        //Optional wrap后的值
        if let str = strValue{
            let hashValue = str.hashValue
            println("hashValue = \(hashValue)")
        }
        //同上
        //        let hashValue = strValue?.hashValue
        //        println("hashValue \(hashValue)")
        
        
        //！
        var myLabelText : String! = "nihao"
        //等同于
        //        var myLabelTextOne : ImplicitlyUnwrappedOptional<String> = "nihao"
    }
    
    
    func firstBiji () {
        //笔记一
        //常量 变量
        let myLet = 1
        println("常量myLet = \(myLet)")
        var myVar = 10
        myVar = 1
        println("变量myVar = \(myVar)")
        
        //支持连续的变量声明
        var myTestOne = 1,myTestTwo = 2,myTestThree = 3
        var myIntVar:Int = 1
        var myStringValue :String = "你好"
        
        /*
        /*
        支持连续 /**/咯，亲，你懂的
        */
        */
        
        //分号
        println("分号测试1");println("分号测试2")
        
        
        //数据类型转换
        let myPi = 3.1415
        let myInt = 1
        let myjia = myPi + Double(myInt)
        println("数据类型转换 = \(myjia)")
        let myUInt16Value:UInt16 = 2_000
        let myUInt8Value:UInt8 = 1
        let myjia2 = myUInt16Value + UInt16(myUInt8Value)
        println("数据类型转换2 = \(myjia2)")
        let myText = "The width is"
        let myTextNum = 94
        let myTextAddNum = myText + String(myTextNum)
        println("数据类型转换2 = \(myTextAddNum)")
        
        
        //类型别名
        typealias MyUInt = UInt
        let myTestUInt :MyUInt = 2_000
        let myTestUInt2 :UInt = 2_000
        
        
        //元组
        let http404Error = (404,"Not Found")
        //组员1
        println("\(http404Error.0)")
        //组员2
        println("\(http404Error.1)")
        
        let newHttp404Error = (statusCode:404, description:"Not Found")
        //新组员1
        println("\(newHttp404Error.statusCode)")
        //新组员2
        println("\(newHttp404Error.description)")
        
        
        //控制流例子
        let individualScores = [75,43,103,87,12]
        var teamSorce = 0
        for sorce in individualScores{
            if sorce > 50{
                teamSorce += 3
            }else{
                teamSorce += 1
            }
        }
        println("teamSorce = \(teamSorce)")//3+1+3+3+1=11
        
        var optionalString :String? = "Hello"
        optionalString == nil
        println("optionalString = \(optionalString)")
        var optionalName :String? = "John Appleseed"
        //        optionalName = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello,\(name)"
        }else{
            greeting = "bye!"
        }
        println("greeting =  \(greeting)")
        
        //断言
        let testAge = -3
        assert(testAge<0,"age less than zero")//通过编译 满足条件不爆
        
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
