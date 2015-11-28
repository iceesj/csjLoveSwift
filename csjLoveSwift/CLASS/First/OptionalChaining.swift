//
//  OptionalChaining.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//可选链
class OptionalChaining: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "可选链"
        optionalChainingMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func optionalChainingMethod(){
        print("----可选链----")
        
        //可选型是！？
        struct MyName{
            var name:String = "nicai"
        }
        struct MyInfo{
            var myName : MyName? = MyName()
        }
        class MyClass{
            var structInstance:MyInfo? = MyInfo()
        }
        let myInstance = MyClass()
        print("myInstance = \(myInstance)")
        
        //使用一连串的可选值，叫做可选链
        //在可选链中，任何一个环节解析失败（nil），那么整个可选链的结果为nil
        if let name = myInstance.structInstance?.myName?.name{
            print(name)
        }else{
            print("nil")
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
