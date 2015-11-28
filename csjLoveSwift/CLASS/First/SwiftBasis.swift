//
//  SwiftBasis.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class SwiftBasis: CSJSwiftViewController {
    
    //Xcode6 beta5
    /*
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    */

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
        //Swift 1.2
//        myNumber.toInt()
        //Swift 2
        Int(myNumber)
        let myNumber1 = "Hello kitty"
        Int(myNumber1)
        //不能编译，crash!!! fatal error: Can't unwrap Optional.None
        //        print("myNumber1's value is \(myNumber1.toInt()!)")
        //可以编译，no crash
        print("myNumber's value is \(Int(myNumber)!)")
        //可这样使用
        if let myActualNumber = Int(myNumber1){
            print("myNumber1's value is \(myActualNumber)")
        }else{
            print("myNumber1 could not be converted to an integer")
        }
        
        
//        var strValue : Optional<String> = "nicai"
        //Xcode6 beta5
        /*
        var strValue :String? = "nicai1" //效果同上
        var strValue1 :String? = "nicai1" //效果同上
        if strValue {
            NSLog("strValue 有值")
        }else{
            NSLog("strValue 无值")// strValue = nil
        }
        print("strValue = \(strValue)")
        //Optional wrap后的值
        if let str = strValue{
            let hashValue = str.hashValue
            print("hashValue = \(hashValue)")
        }
        */
        //同上
        //        let hashValue = strValue?.hashValue
        //        print("hashValue \(hashValue)")
        
        
        //！
        let myLabelText : String! = "nihao"
        print(myLabelText)
        //等同于
        //        var myLabelTextOne : ImplicitlyUnwrappedOptional<String> = "nihao"
    }
    
    
    func firstBiji () {
        //let声明常量 var声明变量
        let myLet = 1
        print("常量myLet = \(myLet)")
        var myVar = 10
        myVar = 1
        print("变量myVar = \(myVar)")
        
        //支持连续的变量声明
        let myTestOne = 1,myTestTwo = 2,myTestThree = 3
        print(myTestOne,myTestTwo,myTestThree)
        let myIntVar:Int = 1
        let myStringValue :String = "你好"
        print(String(myIntVar) + myStringValue)
        
        /*
        /*
        支持连续 /**/咯，亲，你懂的
        */
        */
        
        //分号
        print("分号测试1");print("分号测试2")
        
        
        //数据类型转换
        let myPi = 3.1415
        let myInt = 1
        let myjia = myPi + Double(myInt)
        print("数据类型转换 = \(myjia)")
        let myUInt16Value:UInt16 = 2_000
        let myUInt8Value:UInt8 = 1
        let myjia2 = myUInt16Value + UInt16(myUInt8Value)
        print("数据类型转换2 = \(myjia2)")
        let myText = "The width is"
        let myTextNum = 94
        let myTextAddNum = myText + String(myTextNum)
        print("数据类型转换2 = \(myTextAddNum)")
        
        
        //类型别名
        typealias MyUInt = UInt
        let myTestUInt :MyUInt = 2_000
        let myTestUInt2 :UInt = 2_000
        print("myTestUInt = \(myTestUInt), myTestUInt2 = \(myTestUInt2)")
        
        //元组
        let http404Error = (404,"Not Found")
        //组员1
        print("\(http404Error.0)")
        //组员2
        print("\(http404Error.1)")
        
        let newHttp404Error = (statusCode:404, description:"Not Found")
        //新组员1
        print("\(newHttp404Error.statusCode)")
        //新组员2
        print("\(newHttp404Error.description)")
        
        
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
        print("teamSorce = \(teamSorce)")//3+1+3+3+1=11
        
        var optionalString :String? = "Hello"
        optionalString = nil
        print("optionalString = \(optionalString)")
        let optionalName :String? = "John Appleseed"
        //        optionalName = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello,\(name)"
        }else{
            greeting = "bye!"
        }
        print("greeting =  \(greeting)")
        
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
