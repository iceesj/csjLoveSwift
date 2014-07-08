//
//  SwiftString.swift
//  csjLoveSwift
//
//  Created by 曹 盛杰 on 14-7-6.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class SwiftString: CSJSwiftViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "字符和字符串"
        
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        println("\(wiseWords)")
        // "Imagination is more important than knowledge" - Einstein
        
        let dollarSign = "\x24"        //$ ,Unicode scalar U+0024
        println("dollarSign : \(dollarSign)")
        
        let blackHeart = "\u2665"      //♥ ,Unicode scalar U+2665
        println("blackHeart : \(blackHeart)")
        
        let sparklingHeart = "\U0001F496"//💖
        println("sparklingHeart : \(sparklingHeart)")
        
        //空字符串
        var emptyString = ""
        var anotherEmptyString = String()
        
        if emptyString.isEmpty{
            println("空")
        }
        
        var myString = "hello"
        myString += "world"
        println("myString : \(myString)")
        
        //字符个数 swift用countElements
        let myLongString = "Hello World~"
        println("myLongString has \(countElements(myLongString)) characters")
        
        //包含
        let myStringOne = "你猜"
        myStringOne.hasSuffix("你")
        
        //大小写转换
        let myWord = "Hellow World"
        println(myWord.uppercaseString)   //HELLOW WORLD
        println(myWord.lowercaseString)    //hellow world
        
        //编码
        let myBianma = "apple"
        myBianma.utf8
        myBianma.utf16
        myBianma.unicodeScalars
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
