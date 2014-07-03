//
//  ArrayAndDict.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
<<<<<<< HEAD
//集合类型
=======

>>>>>>> FETCH_HEAD
class ArrayAndDict: CSJSwiftViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "集合类型"
        
<<<<<<< HEAD
        arrayandDict()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func arrayandDict(){
=======
>>>>>>> FETCH_HEAD
        var myArrayOld :String [] = ["var1","var2","var3"]
        //简写为
        var myArray = ["var1","var2","var3"];
        //混杂类型
        var myArrayMix = ["string1",1,2]
        //空array
        var myInts = Int[]()
        // repeatedValue重复值
        var myDouble = Double[](count:3,repeatedValue:0.0)
<<<<<<< HEAD
        
        //数量
        println("数组数量 \(myArray.count)")
        
        //返回用于判断array是不是空
        println("数组是否为空 \(myArray.isEmpty)")//false
        
        //在最后追加元素
        myArray.append("hello")
        println("数组最后添加元素 \(myArray)")
        
        //+＝ 也可以添加元素
        myArray += "world"
        println("数组最后添加元素 \(myArray)")
        
        //指定位置插入
        myArray.insert("need",atIndex:0)
        println("数组插入数据 \(myArray)")
        
        //删除指定下标位置元素
        myArray.removeAtIndex(0)
        println("数组删除指定下标元素 \(myArray)")
        
        //删除最后一个元素
        myArray.removeLast()
        println("数组删除最后一个元素 \(myArray)")
        
        //删除所有元素
//        myArray.removeAll(keepCapacity:false)
//        println("数组删除所有元素 \(myArray)")
        
        //范围下标
        myArray[2...3] = ["china"]
        println("数组范围后 [x...x]<[] \(myArray)")

        //如果 【x...x】> 【】 那么数组不会出错，连续插入
        myArray[1...2] = ["china","shanghai","us"]
        println("数组范围后 [x...x]>[] \(myArray)")
        
    }
    
=======
        //数量
        println("数组数量 \(myArray.count)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

>>>>>>> FETCH_HEAD
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
