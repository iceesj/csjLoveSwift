//
//  ViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
//import UIKit.UIView

enum ViewControllerType :Int {
    case NumOne
    case NumTwo
    case NumThree
}

class ViewController: UIViewController {
    
    @IBOutlet var buttonOne : UIButton
    
    
    //生命周期
    
    //将要消失 -(void)viewWillDisappear:(BOOL)animated
    override func viewWillDisappear(animated:Bool){
        super.viewWillDisappear(animated)
        NSLog("ViewController viewWillDisappear")
    }
    
    //将要出现
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
        NSLog("ViewController viewWillAppear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ViewController"
        buttonOne.setTitle("FirstVC",forState: .Normal)
        
        
        //methods
        great("dev", day: " wwdc day")
        
        myTestMethod()
        
        wwdcRoom102()
        
        firstBiji()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOnePressed(sender : AnyObject) {
        let vc = self.storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as FirstViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc,animated:true)
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
        
//        var sysFont : NSFont = NSFont.systemFontOfSize(0)
        var rect = CGRectMake(10.0, 5.0, 10.0, 10.0)
        var sameRect = CGRect(x:10.0, y:5.0, width:10.0, height: 10.0)
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
        
        
        
    }


}

