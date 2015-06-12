//
//  Inheritance.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//继承
class Inheritance: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "继承"
        inheritanceMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inheritanceMethod(){
        print("----继承----")
        
        //一个类可以从其他类继承方法，属性以及一些特征。被集成的类叫父类，那另一个就是子类
        //Vehicle是一个基类
        class Vehicle {
            var numberOfWheels : Int
            var maxPassengers : Int
            func description() -> String{
                 return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
            }
            
            init (){
                numberOfWheels = 0
                maxPassengers = 1
            }
        }
        
        //继承
        class Car : Vehicle{//继承的语法
            //swift既不会继承父类的初始化，也不会自动执行父类的初始化方法
            override init(){//MyCar 类初始化方法
                super.init()
                numberOfWheels = 4 //从Vehicle继承过来的属性
            }
        }
        
        class CarTwo : Vehicle{
            override init (){
                super.init()
                numberOfWheels = 4
                maxPassengers = 5
            }
        }
        let carTwo = CarTwo() //执行CSJInherTwo的init方法
        print("inher = \(carTwo.description())")//description从父类继承来的，在CSJInherTwo并没有定义
        
        //方法重写 Overriding
        class CarThree : Vehicle{
            var speed : Double = 0
            override init(){
                super.init()
                numberOfWheels = 4
                maxPassengers = 5
            }
            
            override func description() -> String {
                return super.description() + "now speed is \(speed) mph"//只是在父类的description输出内容后面加字
            }
        }
        let carThree = CarThree()
        print("carThree : \(carThree.description())")
        
        //也可以对父类的set和get方法进行重写，但是必须写明属性名和属性类型
        //这样重写是完全忽略这个属性在父类中定义成用于计算或者用于存储的，在子类中提供的set和get方法，可以把父类的“只读”型属性重写成“读写“属性
        //Overriding Property Getters and Setters
        class CarSpeedLimited : CarThree{
            override var speed: Double {
            get {
                return super.speed
            }
            set{
                print("car must speed limited lower than 100 mph")
                super.speed = min(newValue, 40.0)
            }
            }
        }
        let limitedCar = CarSpeedLimited()
//        limitedCar.speed = 60.0 //貌似Xcode6 beta3 bug了 报错Ambiguous use of 'speed'
        print("SpeedLimitedCar: \(limitedCar.description())")
        
        //overriding property observers
        //不能为一个不能改变值的属性重写属性的监听者，比如继承来的只读类型属性
        //不能为一个属性同时加入set方法和监听者
        /*
        class AutomaticCar : CarThree{
            var gear = 1
            override var speed : Double{
                didSet{
//                    gear = 1
                    gear = Int (speed / 10.0) + 1
                }
            }
            override func description() -> String {
                return super.description() + "in gear \(gear)"
            }
//            init() {
//                super.init()
//            }
            
        }
        */
        
        //swift防止重写 使用@final关键字
        class FinalTest {
            var numberOfWheels : Int
            var maxPassengers : Int
            //20140722
            //xcode6 beta3 @final
            //xcode6 beta4 final
            final func nicai()->String{
                return "你猜"
            }
            init(){
                numberOfWheels = 0
                maxPassengers = 1
            }
        }
        
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
