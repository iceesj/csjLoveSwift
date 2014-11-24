//
//  Properties.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//属性(类，结构体，枚举)
class Properties: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "属性"
        propertiesMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func propertiesMethod(){
        println("----属性----")
        
        //存储属性，Stored Properties
        //下面的例子定义了一个称为FixedLengthRange结构,描述了一个范围的整数范围长度,一旦创建不能改变:
        struct FixedLengthRange{
            var firstValue:Int
            let length:Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue:0, length: 3)
        //the range represents integer values 0,1 and 2
        rangeOfThreeItems.firstValue = 6
        //the range now represents integer values 6,7 and 8
        
        //存储属性不变结构的实列，Stored Properties of Constant Structure Instances
        //如果您创建一个结构的实例,并将该实例分配给一个常量,您不能修改实例的属性,即使他们被声明为变量属性:
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        //this range represents integer values 0,1,2 and 3
//        rangeOfFourItems.firstValue = 6  //<---error
        
        //懒惰的存储属性，Lazy Stored Properties
        class DataImporter{
            var fileName = "data.text"
        }
        //xcode6 beta3 有点问题
        /*
        class DataManager {
            @lazy var importer = DataImporter()
            var data = [String]()
        }
        let manager = DataManager()
        manager.data += "Some data"
        manager.data += "Some more data"
        println("manager.data = \(manager.data)")
        println(manager.importer.fileName)
        */
        
        
        //用于计算的属性，Computed Properties
        //这种属性本身并不会保存数值，而是提供了一个getter和一个可选的setter方法，来间接的设置其它属性的值。
        //点
        struct Point{
            var x = 0.0,y = 0.0
        }
        //尺寸
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct Rect {
            //在Rect结构体中有一个center属性，还有一个origin属性和size属性
            //而center属性是完全可以通过origin和size计算得到，并不需要存储
            //反过来，只移动center的话，那么要根据center点和size值就可以计算出新的origin属性的的值。
            //所以center不需要保存什么值，用于计算而非用于存储的属性
            //起始点
            var origin = Point()
            var size = Size()
            var center : Point {
            get {
                let centerX = origin.x + (size.width/2)
                let centerY = origin.y + (size.height/2)
                return Point(x: centerX, y: centerY)
            }
            //为set提供了一个参数newCenter，而这个参数可以被省略，
            //未省略
//            set (newCenter){
//                origin.x = newCenter.x-(size.width/2)
//                origin.y = newCenter.y-(size.height/2)
//            }
            //省略
            set {
                origin.x = newValue.x-(size.width/2)
                origin.y = newValue.y-(size.height/2)
            }
            }
            
        }
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x:15.0,y:15.0)
        println("square.origin is now at (\(square.origin.x),\(square.origin.y))")
        // prints "square.origin is now at (10.0, 10.0)"
        
        //Shorthand Setter Declaration
        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            //省略参数记为newValue
            set {
                origin.x = newValue.x - (size.width / 2)
                origin.y = newValue.y - (size.height / 2)
            }
            }
        }
        
        //只读Read-Only Computed Properties
        //只读用于计算的属性，我们可以省掉get
        struct Cuboid{
            var width = 0.0, height = 0.0, depth = 0.0
            var volume : Double{
                return width*height*depth
            }
        }
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        println("the volume of fourByFiveByTwo is \(fourByFiveByTwo)")
        // prints "the volume of fourByFiveByTwo is 40.0"
        
        //属性观察员Property Observers
        //是在它监控的那个属性被设置时触发的，即使这个属性的新值和原值是一样的
        //willSet 在属性被设置新值，但还没有保存的时候，被调用
        //didSet 在属性保存了新值后立即被调用
        //属性第一次被初始化的时候不会被调用
        class StepCounter{
            //闭包
            var totalSteps : Int = 0{
                willSet(newTotalSteps){
                    println("About to set totalSteps to \(newTotalSteps)")
                }
                didSet{
                    //swift提供oldValue
                    if totalSteps > oldValue{
                        println("Added \(totalSteps-oldValue) steps")
                    }
                }
            
            }
        }
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        //set totalSteps to 200
        //added 200 steps
        stepCounter.totalSteps = 360
        //set totalSteps to 360
        //added 160 steps
        stepCounter.totalSteps = 896
        //set totalSteps to 896
        //added 536 steps
        class TestClass{
            var num:Int=0{
            willSet{
                println("testClass willSet = \(num)")
            }
            didSet {
                num = oldValue//赋值为0，所有输出为0
                println("testClass didSet = \(num)")
            }
            }
        }
        var testClass = TestClass()
        testClass.num = 8
        println("testClass = \(testClass.num)")
        
        
        //全局常量、变量，也都可以设置用于计算的属性，Global and Local Variables
        var Q_myNum = 0
        var Q_myValue:Int{
            return Q_myNum
        }
        println("Q_myNum = \(Q_myValue)")
        
        //类型属性，Type Property Syntax
        //类似c/c++中的静态变量，所有实例共享一份拷贝，而不是每一个实例都有一份
        //swift依然用了static这个关键字，类中用class关键字
        struct SomeStructure{
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                //return an Int value here
                return 0
            }
        }
        enum SomeEnumeration{
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty : Int{
                //return an Int value here
                return 0
            }
        }
        class SomeClass{
            class var computedTypeProperty: Int{
                return 0
            }
        }
        
        //查询和设置类型属性Querying and Setting Type Properties
        println("SomeClass.computedTypeProperty = \(SomeClass.computedTypeProperty)")
        println(SomeStructure.storedTypeProperty)
        SomeStructure.storedTypeProperty = "Another value."
        println(SomeStructure.storedTypeProperty)
        
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
