//
//  ArrayAndDict.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class ArrayAndDict: CSJSwiftViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "集合类型"
        
        var myArrayOld :String [] = ["var1","var2","var3"]
        //简写为
        var myArray = ["var1","var2","var3"];
        //混杂类型
        var myArrayMix = ["string1",1,2]
        //空array
        var myInts = Int[]()
        // repeatedValue重复值
        var myDouble = Double[](count:3,repeatedValue:0.0)
        //数量
        println("数组数量 \(myArray.count)")
        
        
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
