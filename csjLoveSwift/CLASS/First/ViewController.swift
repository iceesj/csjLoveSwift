//
//  ViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit


enum ViewControllerType :Int {
    case NumOne
    case NumTwo
    case NumThree
}

class ViewController: UIViewController {
    
    @IBOutlet var buttonOne : UIButton
    
    
    //生命周期
    
    //view将要消失 -(void)viewWillDisappear:(BOOL)animated
    override func viewWillDisappear(animated:Bool){
        super.viewWillDisappear(animated)
    }
    //view将要出现
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
    }
    //view已经出现
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
    }
    
    
    func loadDataAsy(){
        var url = "http://itunes.apple.com/lookup?id=853116593"
        CSJSwiftRequest.requestWithURLbyiOS7Later(url,completionHandler:{data in
            if data as NSObject == NSNull(){
                CSJSwiftLog.showAlertView("提示",message:"请求连接错误")
                return
            }
            var arr = data["results"] as NSArray
            NSLog("arr = \(arr)")
//            var dict = data as NSDictionary
//            NSLog("dict = \(dict)")
        })
    }
    
    func loadDataSy(){
        var url = "http://itunes.apple.com/lookup?id=853116593"
        CSJSwiftRequest.requestSynchronousWithURL(url,completionHandler:{data in
            if data as NSObject == NSNull(){
                CSJSwiftLog.showAlertView("提示",message:"请求连接错误")
                return
            }
            var arr = data["results"] as NSArray
            NSLog("arr = \(arr)")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("测试 viewDidLoad")
        self.navigationItem.title = "ViewController"
        buttonOne.setTitle("FirstVC",forState: .Normal)
        
        
        //methods
        
        //同步
        loadDataSy()

        
        great("dev", day: " wwdc day")
        
        myTestMethod()
        
        wwdcRoom102()
        
        firstBiji()
        
        optionalBiji()
        
        //异步
//        loadDataAsy()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //各种方法
    
    @IBAction func buttonOnePressed(sender : AnyObject) {
        let vc = self.storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as FirstViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc,animated:true)
    }
    
    @IBAction func alertViewPressed(sender : AnyObject) {
        CSJSwiftLog.showAlertView("提示",message:"已经按下")
    }
    
    /**
    Method
    */
    
    //传入方法输出
    func great(name: String,day :String){
        println( "Hello \(name),today is\(day)")
    }
    
    func myTestMethod () {
        println("Hello Swift" + "im csj")
        
        var languageName1:String = "Swift" //inferred as String
        var version1:Double = 1.0 //inferred as double
        var introduced1:Int = 2014 //inferred as int
        var isAwesome1:Bool = true// inferred as bool
        
        let languageName = "Swift"
        var version = 1.0
        let introduced = 2014
        let isAwesome = true
        
        let 你猜 = "你猜"
        let 😄 = "smile"
        println(你猜+😄)
        
        let components = "~/Documents/Swift".pathComponents
        println("components = \(components)")
        
        //arr
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        println("数组替换组员1位置 \(shoppingList)")
        shoppingList.removeLast()
        println("数组删除最后一个元素 \(shoppingList)")
        //遍历数组
        for number in shoppingList{
            println("i like \(number).")
        }
        //创建空数组
        let newShoppingList = String[]()
        
        //dict
        var dict = ["Earth":"1.0","Mars":"1.524"]
        println("输出dict = \(dict)")
        //添加字典组员
        dict["Moon"] = "2.000"
        for (planet, distance) in dict{
            println("The planet \(planet) is \(distance) AUs from the sun.")
        }
        //创建空字典
        let newDict = Dictionary<String,Float>()
        
        
    }
    
    
    func wwdcRoom102(){
        var specialWords = ["klaatu","barada","nikto"]
        var specialNumbers = [4,8,15,16,23,42]
        func sum(array:Int[])->Int{
            var result = 0
            for value in array {result += value}
            println("result = \(result)")
            return result
        }
        var resultsum = sum(specialNumbers)
        println("resultsum = \(resultsum)")
        func sumAndAverage(array:Int[]) -> (sum:Int, average:Double){
            var result = 0
            for value in array {result += value}
            var avg = Double(result) / Double(array.count)
            return (result, avg)
        }
        var result = sumAndAverage(specialNumbers)
        var rect = CGRectMake(10.0, 5.0, 10.0, 10.0)
        var sameRect = CGRect(x:10.0, y:5.0, width:10.0, height: 10.0)
        if rect == sameRect{
            NSLog("rect = sameRect")
        }
//        extension CGRect{
//            var area:Double {return width *height}
//        }
        
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
        assert(testAge<0,"age less than zero")//通过编译
        
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

}

@objc protocol Downloadable{
    @optional func download(toPath:String)->Bool;
}

