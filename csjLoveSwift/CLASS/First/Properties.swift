//
//  Properties.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
//属性(类，结构体，枚举)
class Properties: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "属性"
        propertiesMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func propertiesMethod(){
        println("----属性----")
        
        //存储属性，Stored Properties
        //下面的例子定义了一个称为FixedLengthRange结构,描述了一个范围的整数范围长度,一旦创建不能改变:
        struct FixedLengthRange{
            var firstValue:Int
            let length:Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue:0, length: 3)
        //the range represents integer values 0,1 and 2
        rangeOfThreeItems.firstValue = 6
        //the range now represents integer values 6,7 and 8
        
        //存储属性不变结构的实列，Stored Properties of Constant Structure Instances
        //如果您创建一个结构的实例,并将该实例分配给一个常量,您不能修改实例的属性,即使他们被声明为变量属性:
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        //this range represents integer values 0,1,2 and 3
//        rangeOfFourItems.firstValue = 6  //<---error
        
        //懒惰的存储属性，Lazy Stored Properties
        class DataImporter{
            var fileName = "data.text"
        }
        
        /*
        class DataManager {
            @lazy var importer = DataImporter()
            var data = [String]()
        }
        let manager = DataManager()
        manager.data += "Some data"
        manager.data += "Some more data"
        println("manager.data = \(manager.data)")
        println(manager.importer.fileName)
        */
        
        //计算属性，Computed Properties
        
        
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
