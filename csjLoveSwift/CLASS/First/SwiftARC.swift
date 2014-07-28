//
//  SwiftARC.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014年 iceesj. All rights reserved.
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
        println("----ARC----")
        
        //ARC机制会跟踪每一个实例正在被多少属性，常量和变量所引用，只要这个实例的引用数不为0，那么这个实例就不会被销毁。那么它的deinit也不会被调用
        //实例之间的循环引用是怎么发生的。如果消除循环引用导致内存泄露
        
        class Person {
            let name : String
            init (name : String) {
                self.name = name
                println("\(name) is being initialized")
            }
            deinit {
                println("\(name) is being deinitialized")
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
                println("\(name) is being deinitialized")
            }
        }
        
        class Apartment{
            let number : Int
            init (number : Int){
                self.number = number
            }
            var tenant : Person?
            deinit {
                println("Apartment #\(number) is being deinitialized")
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
