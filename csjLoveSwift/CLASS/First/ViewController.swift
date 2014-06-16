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
        
        //同步请求
        loadDataSy()
        
        myTestMethod()
        
        wwdcRoom102()
        
        firstBiji()
        
        optionalBiji()

        secondBiji()
        
        thridBiji()
        
        //异步请求
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
        assert(testAge<0,"age less than zero")//通过编译 满足条件不爆
        
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
        func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
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
        let sortTestArr = [1,5,3,12,2]
        sort(sortTestArr) { $0 > $1 }
        //like
        func backwards (s1:Int, s2:Int)->Bool{
            println("\(s1):\(s2)")
            return s1>s2
        }
        var backwardsVar = sort(sortTestArr,backwards)
        println("sortTestArr = \(sortTestArr)")
        println("backwardsVar =  \(backwardsVar)")
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
    func thridBiji(){
        class Shape{
            var numberOfSides = 0
            func simpleDescription()->String{
                return "A shape With \(numberOfSides) sides"
            }
        }
        
        //创建类实例
        var shape = Shape()
        shape.numberOfSides = 7
        var shapeDescription = shape.simpleDescription()
        println("A shape With \(shapeDescription) sides")
        
        class NameShape{
            var numberOfSides : Int = 0
            var name : String
            //通过构造器赋值
            init(name :String){
                self.name = name
            }
        }
        
        class Square :NameShape{
            var sideLength:Double
            init (sideLength :Double,name :String){
                self.sideLength = sideLength
                super.init(name:name)
                numberOfSides = 4
            }
            func area() -> Double{
                return sideLength * sideLength
            }
//            override func simpleDescription() -> String {
//                return "A squar with side of length \(sideLength)."
//            }
        }
        
        let test = Square(sideLength: 5.2, name: "my test square")
        test.area()
        test.simpleDescription()
        
        
        
    }
    
    
}
@objc protocol Downloadable{
    @optional func download(toPath:String)->Bool;
}




