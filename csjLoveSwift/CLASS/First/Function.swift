//
//  Function.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-9.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class Function: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        function()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func function(){
//        func 函数名(参数名字:参数类型)->返回值类型{//多个参数用","分离
//        }
        func myFunc(someBody:String, saySomethring:String)->String{
             return someBody + "say" + saySomethring
        }
        
        //无参函数
        func wucanHanshu()->String{
            return "你好"
        }
        
        //无返回值函数
        func wufanhuiZhi(){
            
        }
        
        //多返回值函数
        
        
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
