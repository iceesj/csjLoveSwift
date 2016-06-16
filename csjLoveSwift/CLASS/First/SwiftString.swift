//
//  SwiftString.swift
//  csjLoveSwift
//
//  Created by 曹 盛杰 on 14-7-6.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//字符，字符串
class SwiftString: CSJSwiftViewController {
    
    //Xcode6 beta5
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "字符和字符串"
        
        let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
        print("\(wiseWords)")
        // "Imagination is more important than knowledge" - Einstein
        
//        let dollarSign = "\x24"        //$ ,Unicode scalar U+0024
        let dollarSign = "\u{24}"
        print("dollarSign : \(dollarSign)")
        
        let blackHeart = "\u{2665}"      //♥ ,Unicode scalar U+2665
        print("blackHeart : \(blackHeart)")
        
        //xcode6 beta 1,2,3
//        let sparklingHeart = "\U0001F496"
        //xcode6 beta4
        let sparklingHeart = "\u{0001F496}"
        //💖
        print("sparklingHeart : \(sparklingHeart)")
        
        //空字符串
        let emptyString = ""
        let anotherEmptyString = String()
        print(emptyString)
        print(anotherEmptyString)
        
        if emptyString.isEmpty{
            print("空")
        }
        
        var myString = "hello"
        myString += "world"
        print("myString : \(myString)")
        
        //字符个数 swift用countElements
//        let myLongString = "Hello World~"
        //20150603 弃用countElements，使用count
        //Swift 2 删除
//        print("myLongString has \(count(myLongString)) characters")
        
        
        //包含
        let myStringOne = "你猜"
        myStringOne.hasSuffix("你")
        
        //大小写转换
        let myWord = "Hellow World"
        print(myWord.uppercased())   //HELLOW WORLD
        print(myWord.lowercased())    //hellow world
        
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
