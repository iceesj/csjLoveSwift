//
//  ArrayAndDict.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//集合类型

class ArrayAndDict: CSJSwiftViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "集合类型"
        
        arrayBasic()
        
        dictBasic()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func arrayBasic(){
//        var myArrayOld : String[] = ["var1","var2","var3"]
        //Xcode6 beta3
        let myArrayOld :[String] = ["var1","var2","var3"]
        print("myArrayOld = \(myArrayOld)")
        //简写为
        var myArray = ["var1","var2","var3"];
        //混杂类型
        //Swift3beta5
//        let myArrayMix = ["string1",1,2]
        //Swift3beta6
        let myArrayMix = ["string1",1,2] as [Any]
        
        print("myArrayMix = \(myArrayMix)")
        
        //空array
//        var myInts = Int[] ()
        //Xcode6 beta3
        let myInts = [Int] ()
        print("myInts = \(myInts)")
        // repeatedValue重复值
//        var myDouble = Double[](count:3,repeatedValue:0.0)
        //20140707 Xcode6 beta3
        let myDouble = [Double](repeating: 0.0,count: 3)
        print("myDouble = \(myDouble)")
        
        //数量
        print("数组数量 \(myArray.count)")
        
        //返回用于判断array是不是空
        print("数组是否为空 \(myArray.isEmpty)")//false
        
        //在最后追加元素
        myArray.append("hello")
        print("数组最后添加元素 \(myArray)")
        
        //+＝ 也可以添加元素
        //Xcode6 beta5
        // error: '[String]' is not identical to 'UInt8'
//        myArray += "world"
//        print("数组最后添加元素 \(myArray)")
        
        //指定位置插入
        myArray.insert("need",at:0)
        print("数组插入数据 \(myArray)")
        
        //删除指定下标位置元素
        myArray.remove(at: 0)
        print("数组删除指定下标元素 \(myArray)")
        
        //删除最后一个元素
        myArray.removeLast()
        print("数组删除最后一个元素 \(myArray)")
        
        //删除所有元素
//        myArray.removeAll(keepCapacity:false)
        //另一种方法
//        myArray = []
//        print("数组删除所有元素 \(myArray)")
        
        //范围下标
//        myArray[2...3] = ["china"]
//        print("数组范围后 [x...x]<[] \(myArray)")

        //如果 [x...x]> [] 那么数组不会出错，连续插入
        //越界依然会崩溃 [2...3]
        myArray[1...2] = ["china","shanghai","us"]
        print("数组范围后 [x...x]>[] \(myArray)")
        
        //下标语法subscript syntax
        let myFirst = myArray[0]
        print("数组第一个元素是 \(myFirst)")
        
        //遍历
        for item in myArray{
            print(item)
        }
        
        //enumerate
        //Swift 2 去除
//        for (index, value)in enumerate(myArray){
//            print("item \(index+1):\(value)")
//        }
        
        
        
    }
    
    func dictBasic(){
        //key要唯一，如果对一个已有的key操作，会改掉原值
        //所有Swift的基本数据类型，String, Int, Double, Bool 全都可以做为key
//        var myDict : Dictionary<String,String> = ["china":"panda","australia":"kangaroo"]
        var myDict = ["china":"panda","australia":"kangaroo"]
        
        //创建空Dict
        var myKong = Dictionary <String,String>()
        //清空Dict
        myKong = [:]
        print("let = \(myKong)")
        
        //Dict中key-value的数量
        print("字典数量 \(myDict.count)")
        
        //改某个key的值
        myDict["australia"] = "duckbill"
        
        //遍历
        for (country, animal)in myDict{
            print("counter:\(country),animal:\(animal)")
        }
        
        //单独遍历key
        for country in myDict.keys{
            print("myDict的key \(country)")
        }
        
        //单独遍历value
        for animal in myDict.values{
            print("myDict的values \(animal)")
        }
        
        //key拿出创建array
        let myKeyArr = Array(myDict.keys)
        //value拿出创建array
        let myValueArr = Array(myDict.values)
        
        print(myKeyArr)
        print(myValueArr)
    }
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
