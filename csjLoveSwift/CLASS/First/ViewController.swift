//
//  ViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-3.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit


enum ViewControllerType :Int {
    case numOne
    case numTwo
    case numThree
}

class ViewController: UIViewController {
    //xcode6 beta4 UIButton? before UIButton
    @IBOutlet var buttonOne : UIButton?
    
    
    //生命周期
    
    //view将要消失 -(void)viewWillDisappear:(BOOL)animated
    override func viewWillDisappear(_ animated:Bool){
        super.viewWillDisappear(animated)
    }
    //view将要出现
    override func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
    }
    //view已经出现
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
    }
    
    
    func loadDataAsy(){
        //Swift 2 改成let
        let url = "http://itunes.apple.com/lookup?id=853116593"
        CSJSwiftRequest.requestWithURLbyiOS7Later(url,completionHandler:{data in
            if data as! NSObject == NSNull(){
                CSJSwiftLog.showAlertView("提示",message:"请求连接错误")
                return
            }
            let arr = data["results"] as! NSArray
            NSLog("arr = \(arr)")
//            var dict = data as NSDictionary
//            NSLog("dict = \(dict)")
        })
    }
    
    func loadDataSy(){
        let url = "http://itunes.apple.com/lookup?id=853116593"
        CSJSwiftRequest.requestSynchronousWithURL(url,completionHandler:{data in
            if data as! NSObject == NSNull(){
                CSJSwiftLog.showAlertView("提示",message:"请求连接错误")
                return
            }
            let arr = data["results"] as! NSArray
            NSLog("arr = \(arr)")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("测试 viewDidLoad")
        self.navigationItem.title = "ViewController"
        //xcode6 beta 1,2,3
//        buttonOne.setTitle("Basic knowledge",forState: .Normal)
        //xcode6 beta 4
        buttonOne?.setTitle("Basic knowledge", for: UIControl.State())
        
        //methods
        
        //同步请求
        loadDataSy()
        
        myTestMethod()
        

        secondBiji()
        
        //对象和类
//        thridBiji()
        let shape = Shape()
        shape.numberOfSides = 7
        let shapeDescription = shape.simpleDescriptionLet()
        print("A shape With \(shapeDescription) sides")
        
        let test = Square(sideLength:5.2, name:"my test square")
        let testArea = test.area()
        print("test = \(testArea)")
        let simpleDescription = test.simpleDescription()
        print("simp = \(simpleDescription)")
        
        let triangle = EquilateralTriangle(sideLength:3.1, name:"a triangle")
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
    
    @IBAction func buttonOnePressed(_ sender : AnyObject) {
        //xcode6 beta7 添加!
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "FirstBetaViewController") as! FirstBetaViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(vc,animated:true)
    }
    
    @IBAction func alertViewPressed(_ sender : AnyObject) {
        CSJSwiftLog.showAlertView("提示",message:"已经按下")
    }
    
    /**
    Method
    */

    func myTestMethod () {
        print("Hello Swift" + "im csj")
        
        let languageName1:String = "Swift" //inferred as String
        let version1:Double = 1.0 //inferred as double
        let introduced1:Int = 2014 //inferred as int
//        let isAwesome1:Bool = true// inferred as bool
        
        let languageName = "Swift"
        let version = 1.0
        let introduced = 2014
//        let isAwesome = true
        
        //Swift 2
        print(languageName1,version1,introduced1,languageName,version,introduced)
        
        let 你猜 = "你猜"
        let 😄 = "smile"
        print(你猜+😄)
        
//        let components = "~/Documents/Swift".pathComponents
//        print("components = \(components)")
        
        //arr
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        print("数组替换组员1位置 \(shoppingList)")
        shoppingList.removeLast()
        print("数组删除最后一个元素 \(shoppingList)")
        //遍历数组
        for number in shoppingList{
            print("i like \(number).")
        }
        //创建空数组 20140708
//        let newShoppingList = String[]()
        let newShoppingL = [String]()
        print(newShoppingL)
        
        //dict
        var dict = ["Earth":"1.0","Mars":"1.524"]
        print("输出dict = \(dict)")
        //添加字典组员
        dict["Moon"] = "2.000"
        for (planet, distance) in dict{
            print("The planet \(planet) is \(distance) AUs from the sun.")
        }
        //创建空字典
        let newDict = Dictionary<String,Float>()
        print("创建空字典 = \(newDict)")
        
    }
    

    func secondBiji(){
        //循环使用
        var a = 1
        a += 2
        print("运算笔记a = \(a)");
        
        //传入方法输出
        great("dev", day: " wwdc day")
        //返回元组
        let getGasPrices = self.getGasPrices()
        print(getGasPrices)
        //传入参数数量可变
        let sumOf = self.sumOf(42,597,12)
        print("sumOf = \(sumOf)")
        
        //函数嵌套
        self.returnFifteen()
        
        //函数外调用
        var incrementTest = self.makeIncrementerString()
        incrementTest(7,"hello")
        
        //传入Int，返回另一个函数的返回值Int
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne(_ number: Int) -> Int {
                return 1 + number
            }
            return addOne
        }
        var increment = makeIncrementer()
        increment(7)
        
        
        //准备传入的函数
        func lessThanTen(_ number: Int) -> Bool {
            return number < 10
        }
        var numbers = [20, 19, 7, 12]
        //Swift 1.2
//        hasAnyMatches(numbers, lessThanTen)
        //Swift 2
        hasAnyMatches(numbers, condition: lessThanTen)
        
        //用{}来创建一个匿名闭包，使用in将参数和返回值类型与闭包函数函数体进行分离
        //Swift 2.2
        let nihao = numbers.map({
            (number:Int) -> Int in
            let result = 3*number
            return result
        })
        print("nihao = \(nihao)")
        
        
        var sortTestArr = [1,5,3,12,2]
        //貌似不行
//        sorted(sortTestArr,<)
        //貌似行
        //Swift 2 去除
//        sort(&sortTestArr,<)
//        sort(sortTestArr) { $0 > $1 }
        print("sortTestArr1 = \(sortTestArr)")

        //like
        func backwards (_ s1:Int, s2:Int)->Bool{
            print("\(s1):\(s2)")
            return s1>s2
        }
//        var backwardsVar = sort(sortTestArr,backwards)
        print("sortTestArr2 = \(sortTestArr)")
//        print("backwardsVar =  \(backwardsVar)")
    }
    
    //函数也可以当做参数传入另一个函数。 swift failed with exit code 254 :-(
    //Xcode6 beta3
    func hasAnyMatches(_ list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    //secondBiji
    //传入方法输出
    func great(_ name: String,day :String){
        print( "Hello \(name),today is\(day)")
    }
    //返回元组
    func getGasPrices() -> (Double,Double,Double){
        return (3.59, 3.69, 3.79)
    }
    //传入参数数量可变
    func sumOf(_ numbers:Int...) -> Int{
        var sum = 0
        //遍历传进来的数组
        for number in numbers{
            //累加
            sum += number
        }
        print("传入参数数量可变 输出 = \(sum)")
        return sum
    }
    //函数嵌套
    func returnFifteen() -> Int{
        var y = 10
        func add(){
            y+=5
        }
        add()
        print("函数嵌套 输出 = \(y)")
        return y
    }
    //函数可以作为另一个函数的返回值
    func makeIncrementerString() -> ((Int,String) -> String) {
        func addOne(_ number: Int , str:String) -> String {
            return str + String(number)
        }
        return addOne
    }
    
    //对象和类
//    func thridBiji(){
//    }
    
    
}

@objc protocol Downloadable{
    //20140722 xcode6 beta3 @optional ，，xcode6 beta4 optional
    @objc optional func download(_ toPath:String)->Bool;
}




