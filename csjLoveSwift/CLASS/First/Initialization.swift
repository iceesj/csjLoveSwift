//
//  Initialization.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//构造过程（初始化）
class Initialization: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "构造过程"
        initializationMethod()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializationMethod(){
        println("----构造过程----")
        
        //生成class，struct，enum等实例的准备过程叫做构造过程。
        //通常定义一个方法来完成，这个方法叫做，构造器。
        //它的逆向过程，叫做析构器，用于在实例被释放前做一些清理工作和自定义的处理
        
        //为存储属性设置初始值，必须为所有属性服赋特点的初始值
        //在定义存储型属性时直接给个初始值，否则就必须在init里面指定一个初始值
        //上述方法都不会触发存储型属性的坚挺者行为
        
        //Initializers
        struct Fahrenheit{
            var temperature: Double
            init (){
                temperature = 32.0
            }
        }
        var f = Fahrenheit()
        println("The default temperature is \(f.temperature)° Fahrenheit")
        // prints "The default temperature is 32.0° Fahrenheit"
        //直接定义
        struct FahreheitTwo{
            var temperature: Double = 1.0
        }
        
        //Customizing Initialization
        //Initialization Parameters
        struct Celsius{
            var temperatureInCelsius:Double = 0.0
            init (fromFahrenheit fahrenheit:Double){
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            //可以定义多个构造器
            init (fromKelvin kelvin:Double){
                temperatureInCelsius = kelvin - 273.15
            }
        }
        //沸点
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        //冰点
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        
        
        //本地和外部参数名称，Local and External Parameter Names
        //下面的例子定义了一个结构称为颜色,和三个常量属性称为红、绿、蓝。这些属性存储一个值在0.0和1.0之间显示红、绿、蓝的颜色。
        //颜色提供了一个初始化器和三个适当命名的参数类型
        struct Color{
            var red = 0.0 ,green = 0.0 ,blue = 0.0
            init (red:Double, green:Double, blue:Double){
                self.red  = red
                self.green = green
                self.blue = blue
            }
        }
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
//        let veryGreen = Color(0.0,1.0,0.0)
        // this reports a compile-time error - external names are required
        
        //可选属性类型，Optional Property Types
        class SurveyQuestion{
            var text:String
            var response:String?//<--- ?
            init (text:String){
                self.text = text
            }
            func ask(){
                println(text)
            }
        }
        let cheeseQuestion = SurveyQuestion(text:"Do you like cheese?")
        cheeseQuestion.ask()
        cheeseQuestion.response = "Yes,I do like cheese."
        println(cheeseQuestion.response)//输出结果
        
        //在初始化期间修改常量属性，Modifying Constant Properties During Initialization
        class SurveyQuestionTwo {
            let text:String
            var response:String?
            init (text :String){
                self.text = text
            }
            
            func ask() {
                println(text)
            }
        }
        let beetsQuestion = SurveyQuestion(text: "How about beets")
        beetsQuestion.ask()
        beetsQuestion.response = "I also like beets.(But not with cheese.)"
        
        
        //默认初始化，Default Initializers
        class ShoppingListItem {
            var name:String?
//            var quantity ＝ 1 //Xcode6 beta 3 bug
            var purchased = false
        }
        
        //Memberwise Initializers for Structure Types
        struct SizeTest {
            var width = 0.0, heigh = 0.0
        }
        let twoByTwo = SizeTest(width: 2.0, heigh: 2.0)
        struct MyShruct {
            var name = "1", number = 2
        }
        let myStruct = MyShruct(name: "Hello", number: 2)
        
        
        //值类型的构造器代理Initializer Delegation for Value Types
        //init还能调用其他的构造器作为构造过程的一部分。这的过程叫做构造器代理
        //值类型（struct，enum）并不支持继承，所以，他们构造器代理与类的构造器代理规则和形式有所区别
        struct Size{
            var width = 0.0 ,height = 0.0
        }
        struct Point {
            var x = 0.0,y = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
            init (){}
            
            
            init (origin:Point, size:Size){
                self.origin = origin
                self.size = size
            }
            
            init (center:Point, size:Size){
                let originX = center.x - (size.width / 2)
                let originY = center.y - (size.height / 2)
                self.init(origin:Point(x: originX, y: originY),size:size)
            }
            
        }
        //Rect中有3个构造器，第一个是空{}，当这个构造器被调用的时候：
//        let rect = Rect()
//        println(rect)//origin (0.0 ,0.0) ,size (0.0, 0.0)
        let originRect = Rect(origin: Point(x:2.0,y:2.0), size: Size(width: 5.0, height: 5.0))
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        
        //类继承和构造过程， Class Inheritance and Initialization
        //swift提供了2种构造器，以确保所有的属性都能被初始化，指定构造器 和 便利构造器
        //https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-XID_265
        //构造器调用链
        //指定构造器和便利构造器的调用关系，swift指定了3条规则
        //1，构造器代理必须调用他的直接父类的指定构造器
        //2，便利构造器必须调用它同一个类中定义的其他构造器
        //3，便利构造器的结尾部分必须调用一个指定构造器
        
        //指定构造器必须总是向上代理 向上代理的意思就是调用父类指定的构造器
        //便利构造器必须总是横向代理 横向代理的意思就是调用它自己类内的构造器
        
        //指定构造器和便利构造器，Designated Initializers and Convenience Initializers
        //指定构造器 <-- 便利构造器 <-- 便利构造器   【一个类】
        //        ^
        //        |
        //         \
        //便利构造器 ->指定构造器  <-- 便利构造器 【一个类】
        
        
        //两段式构造过程，Two-Phase Initialization
        //swift类包含2个阶段
        //1，每个存储型属性通过她们自己的类构造器来设置初始值
        //2，每个存储型属性都可以进一步设置他们定制化的初始化
        //so两段式构造过程，就是告诉我们，使用变量，常量之前要确保它被定义并且被初始化了
        var csjNumA:Int = 1
        var csjNumB:Int = 2
        func csjNumFunc(){
            csjNumA = csjNumB
        }
        
        //构造器的继承和重写，Initializer Inheritance and Overriding
        //swift中，子类不会默认的继承父类的构造器。但是有时觉得父类的构造器功能不够强大，这个时候就要在子类中重写构造器，以达到目的。
        //重写一个指定构造器， 写完之后要调用父类构造器
        //重写一个便利构造器，必须要调用这个类中的其他指定构造器
        //构造器重写不需要添加 override关键字
        
        //自动构造器的继承，Automatic Initializer Inheritance
        //swift构造器继承机制要满足2点：
        //1，如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器
        //2，如果子类中定义了所有父类的指定构造器的实现，它将会自动继承所有父类的便利构造器
        
        
        //指定构造器和便利构造器的语法，Syntax for Designated and Convenience Initializers
        //指定构造器
        //init(参数){
        //    函数体
        //}
        
        //便利构造器
        //convenience init(参数){
        //    函数体
        //}
        //convenience型的构造器，只能调用它自己这个类中的非convenience
        
        
        //指定和便利构造器初始化，Designated and Convenience Initializers in Action
        
        
        //用闭包或者函数设置属性的默认值，Setting a Default Property Value with a Closure or Function
        class MyClass{
            var myNumbers:[Int] = {
                var tempNum = [Int]() //生成一个临时的数组，在闭包最后给myNumbers赋值
                for i in 1...10{
                    tempNum.append(i) //添加元素
                }
                return tempNum //闭包的返回值
            }() //（）表示myNumbers是闭包的返回值，要不然就成了闭包这个函数了
            
            func getNumbers()->[Int]{
                return myNumbers
            }
        }
        let myClass = MyClass()
        println("myClass.getNumbers =  \(myClass.getNumbers())")//获取到了MyClass的myNumbers数组
        
        
        
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
