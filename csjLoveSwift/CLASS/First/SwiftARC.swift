//
//  SwiftARC.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//Automatic Reference Counting
class SwiftARC: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ARC"
        swiftARCMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swiftARCMethod(){
        print("----ARC----")
        
        //ARC机制会跟踪每一个实例正在被多少属性，常量和变量所引用，只要这个实例的引用数不为0，那么这个实例就不会被销毁。那么它的deinit也不会被调用
        //实例之间的循环引用是怎么发生的。如果消除循环引用导致内存泄露
        
        class Person {
            let name : String
            init (name : String) {
                self.name = name
                print("\(name) is being initialized")
            }
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        
        var reference1:Person?
        var reference2:Person?
        var reference3:Person?
        
        reference1 = Person(name: "John Appleseed")
        reference2 = reference1
        reference3 = reference1
        
        reference1 = nil
        reference2 = nil
        reference3 = nil
        
        print("结果 = \(reference1),\(reference2),\(reference3)")
    }
    
    func swiftARCMethodTwo() {
        //Strong Reference Cycles Between Class Instances
        
        
        class Person {
            let name : String
            init (name : String){
                self.name = name
            }
            
            var apartment: Apartment?
            deinit {
//                apartment = nil;
                print("\(name) is being deinitialized")
            }
        }
        
        class Apartment{
            let number : Int
            init (number : Int){
                self.number = number
            }
            weak var tenant : Person?
            deinit {
//                tenant = nil;
                print("Apartment #\(number) is being deinitialized")
            }
        }
        //上2个类分别都有另一个类的optional类型的变量。结果就是互相持有对方
        //在ARC中，当把John和number73都赋值为nil时，看似断了2个引用，但在实例中，还有apartment和tenant2个引用没断，于是，把释放写入deinit中
        //deinit并不会被调用。因为ARC中只有引用计数到0时，deinit才会被调用
        //为了解决上面的循环引用，引入了关键字weak
        var john : Person?
        var number73 : Apartment?
        john = Person(name: "John Appleseed")
        number73 = Apartment(number: 73)
        
        john!.apartment = number73
        number73!.tenant = john
        
//        john          number73
//         \strong         \strong
// name:John Appleseed  --->strong     number:73
// apartmen<Apartment 实例> <---weak  tenant:<Person 实例>
        //引入了weak引用不会阻止ARC回收实例，也就是说，一个实例，如果没有被强引用，再多的引用持有它的话，它依然可以被释放。
        
        
        //无主引用，Unowned References
        //weak是给optional类型用的（！？），而unowned是给非可选型用的
        class Customer{
            let name :String
            var card : CreditCard?
            init (name : String){
                self.name = name
            }
            
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        class CreditCard{
            let number : UInt64
            unowned let customer : Customer
//            weak var customer : Customer?
            init (number : UInt64 , customer : Customer){
                self.number = number
                self.customer = customer
            }
            deinit {
                 print("Card #\(number) is being deinitialized")
            }
        }
        var johnOne : Customer?
        johnOne = Customer(name: "John Appleseed")
        johnOne!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnOne!)
        
        
        //闭包导致的循环强引用，Strong Reference Cycles for Closures
        /*
        class HTMLElement{
            let name: String
            let text: String?
            //闭包
            lazy var asHTML: () -> String = {
//                [unowned self] in
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                self.name = name
                self.text = text
            }
            
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        */
        
        
        
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
