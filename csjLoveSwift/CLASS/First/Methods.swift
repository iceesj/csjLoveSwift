//
//  Methods.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//方法(类，结构体，枚举)
class Methods: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "方法"
        methodsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func methodsMethod() {
        print("----方法----")
        
        //实例方法，Instance Methods
        //swift会为方法的第一个参数只提供函数内部使用的名字，从第二个参数开始，既可以外部用，也可以内部用
        class CsjClass{
            var myNum : Int = 0
            func increaseNum(_ base:Int, numberOfTimes:Int){
                myNum += base * numberOfTimes
            }
        }
        let csjClass = CsjClass()
        //第二个参数开始，会自动提供一个外部使用变量名
        csjClass.increaseNum(10, numberOfTimes: 8)//******
        
        //func想为外部提供一个变量名的话有2种做法
        //func csjFunc(value paramA:Int){......} //value是给外部使用的名字，paramA是内部使用
        //func csjFunc(#paramA:Int) {......} //paramA 既是外部用的，也是内部用的
        //csjClass类的实例方法中，相当于，从第二个参数开始，swift自动为我们提供了"#"的功能，不需要我们写#
        class NewCsjClass{
            var myNum : Int = 0
            //"_ "这样swift就不再会自动提供外部使用名字了
            func increaseNum(_ base:Int, _ numberOfTimes:Int){
                myNum += base * numberOfTimes
            }
        }
        let newCsjClass = NewCsjClass()
        newCsjClass.increaseNum(10, 8)//******
        
        
        //self属性，The self Property
        //每个实例，都有一个属性用于表示它自己这个实例，这个属性叫做self
        class CSJSedClass {
            var num : Int = 0
            //传入参数名叫num，设置属性也叫num的时候，到底是传入的值，还是实例的属性，我们为实例属性前面加了self，表示这个是实例自己的属性
            func setNume(_ num:Int){
                self.num = num
            }
        }
        
        //变化（修改）方法，修改值类型的实例方法，Modifying Value Types from Within Instance Methods
        //上述都是class的情况，对于struct，enum这样的值传递类型，却不能使用实例方法来改变属性的值
        struct CSJPoint{
            var x = 0, y = 0
            mutating func moveByXY(_ deltaX: Int, y deltaY:Int){
                x += deltaX
                y += deltaY
            }
        }
        var csjPoint = CSJPoint()
        csjPoint.moveByXY(3, y: 4)
        print("x:\(csjPoint.x),y:\(csjPoint.y)")
        //在struct，enum里使用mutating关键字，达到class里一样的效果
        //如果x,y是let就不能使用，不能改变常量
        
        //在mutating方法中，给self赋值
        struct CSJTwoPoint{
            var x = 0 ,y = 0
            mutating func changeSelf(_ deltaX:Int, y deltaY:Int){
                self = CSJTwoPoint(x:deltaX,y:deltaY)
            }
        }
        var csjTwoPoint = CSJTwoPoint()
        csjTwoPoint.changeSelf(3,y:4)
        print("x:\(csjTwoPoint.x),y:\(csjTwoPoint.y)")
        //达到了改变csjTwoPoint中x和y的目的，给self赋值的方法，却是生成了一个新的CSJTwoPoint实例（内部做了内存释放工作）
        enum CSJStateMachine{
            case none,`init`,run,`deinit`
            //实例方法
            /*
            mutating func nextState(){
                switch self{
                case none:self = `init`
                case init:self = run
                case run:self = `deinit`
                case deinit:self = none
                }
            }
            */
        }
        /*
        var csjStateMachine = CSJStateMachine.none
        csjStateMachine.nextState() //self变成Init
        print(csjStateMachine == CSJStateMachine)//ture
        csjStateMachine.nextState()
        print(csjStateMachine == CSJStateMachine.run)//ture
        */
        //状态机的状态切换代码可以直接写在enum的定义中
        
        //类型方法，Type Methods
        //上面地方都是实例方法，它们都是针对某一个实例进行操作的，而类方法，是对这个类型的。（static和class）
        class TestClass{
            class var computedProperty : Int {
                return 0
            }
            class func someMethod(){
                //这才是一个类方法
            }
        }
        //因为类里面的类型属性只能用于计算，不能保存数据，所以类的类方法，暂时不适合写一个可以跑起来的例子，应该结合struct或者enum，才可以写
        struct LevelTracker{//等级跟踪器
            static var highestUnlockedLevel = 1//类型属性，所有的实例共用这个值
            //类方法
            static func unlockLevel(_ level: Int){
                if level > highestUnlockedLevel{
                    highestUnlockedLevel = level
                }
            }
            //类方法
            static func levelIsUnlocked(_ level : Int) -> Bool{
                return level <= highestUnlockedLevel
            }
            var currentLevel = 1
            
            mutating func advanceToLevel(_ level:Int) ->Bool{
                if LevelTracker.levelIsUnlocked(level){
                    currentLevel = level
                    return true
                }else{
                    return false
                }
            }
        }
        
        class Player {
            var tracker = LevelTracker()
            let playName : String
            func completedLevel(_ level:Int){
                LevelTracker.unlockLevel(level+1)//调用结构体类方法
                //Swift3beta2 去除
//                tracker.advanceToLevel(level+1) //调用了tracker的实例advanceToLevel
            }
            
            init(name:String){
                playName = name
            }
        }
        let player = Player(name:"World")
        player.completedLevel(1)//调用后 tarcker的highestUnlockedLevel变成2
        print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        
        let player2 = Player(name:"Kitty")
        if player2.tracker.advanceToLevel(6){
            print("player is not on level 6")
        }else{
            print("level 6 has not yet been unlocked")
        }
        
        
//        class Counter {
//            var count = 0
//            func increment(){
//                count++
//            }
//        }
        
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
