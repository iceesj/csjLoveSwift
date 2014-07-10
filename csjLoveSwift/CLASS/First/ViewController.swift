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
        buttonOne.setTitle("Basic knowledge",forState: .Normal)
        
        
        //methods
        
        //同步请求
        loadDataSy()
        
        myTestMethod()
        

        secondBiji()
        
        //对象和类
//        thridBiji()
        var shape = Shape()
        shape.numberOfSides = 7
        var shapeDescription = shape.simpleDescriptionLet()
        println("A shape With \(shapeDescription) sides")
        
        let test = Square(sideLength:5.2, name:"my test square")
        test.area()
        test.simpleDescription()
        
        var triangle = EquilateralTriangle(sideLength:3.1, name:"a triangle")
        triangle.perimeter = 9.9
        triangle.sideLength = 8.8
        
        
        //异步请求
//        loadDataAsy()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //各种方法
    
    @IBAction func buttonOnePressed(sender : AnyObject) {
        let vc = self.storyboard.instantiateViewControllerWithIdentifier("FirstBetaViewController") as FirstBetaViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController.pushViewController(vc,animated:true)
    }
    
    @IBAction func alertViewPressed(sender : AnyObject) {
        CSJSwiftLog.showAlertView("提示",message:"已经按下")
    }
    
    /**
    Method
    */

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
        //创建空数组 20140708
//        let newShoppingList = String[]()
        let newShoppingL = [String]()
        
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
    

    func secondBiji(){
        //循环使用
        var a = 1
        a += 2
        println("运算笔记a = \(a)");
        
        //传入方法输出
        great("dev", day: " wwdc day")
        //返回元组
        getGasPrices()
        //传入参数数量可变
        sumOf(42,597,12)
        
        //函数嵌套
        returnFifteen()
        
        //函数外调用
        var incrementTest = makeIncrementerString()
        incrementTest(7,"hello")
        
        //传入Int，返回另一个函数的返回值Int
        func makeIncrementer() -> (Int -> Int) {
            func addOne(number: Int) -> Int {
                return 1 + number
            }
            return addOne
        }
        var increment = makeIncrementer()
        increment(7)
        
        //函数也可以当做参数传入另一个函数。 swift failed with exit code 254 :-(
        //Xcode6 beta3
        func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        //准备传入的函数
        func lessThanTen(number: Int) -> Bool {
            return number < 10
        }
        var numbers = [20, 19, 7, 12]
        hasAnyMatches(numbers, lessThanTen)
        
        //用{}来创建一个匿名闭包，使用in将参数和返回值类型与闭包函数函数体进行分离
        numbers.map({
            (number:Int) -> Int in
            let result = 3*number
            return result
        })
        
        var sortTestArr = [1,5,3,12,2]
        //貌似不行
//        sorted(sortTestArr,<)
        //貌似行
        sort(&sortTestArr,<)
//        sort(sortTestArr) { $0 > $1 }
        println("sortTestArr1 = \(sortTestArr)")

        //like
        func backwards (s1:Int, s2:Int)->Bool{
            println("\(s1):\(s2)")
            return s1>s2
        }
//        var backwardsVar = sort(sortTestArr,backwards)
        println("sortTestArr2 = \(sortTestArr)")
//        println("backwardsVar =  \(backwardsVar)")
    }

    //secondBiji
    //传入方法输出
    func great(name: String,day :String){
        println( "Hello \(name),today is\(day)")
    }
    //返回元组
    func getGasPrices() -> (Double,Double,Double){
        return (3.59, 3.69, 3.79)
    }
    //传入参数数量可变
    func sumOf(numbers:Int...) -> Int{
        var sum = 0
        //遍历传进来的数组
        for number in numbers{
            //累加
            sum += number
        }
        println("传入参数数量可变 输出 = \(sum)")
        return sum
    }
    //函数嵌套
    func returnFifteen() -> Int{
        var y = 10
        func add(){
            y+=5
        }
        add()
        println("函数嵌套 输出 = \(y)")
        return y
    }
    //函数可以作为另一个函数的返回值
    func makeIncrementerString() -> ((Int,String) -> String) {
        func addOne(number: Int , str:String) -> String {
            return str + String(number)
        }
        return addOne
    }
    
    //对象和类
//    func thridBiji(){
//    }
    
    
}
@objc protocol Downloadable{
    @optional func download(toPath:String)->Bool;
}




