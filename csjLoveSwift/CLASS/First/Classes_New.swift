//
//  Classes_New.swift
//  csjLoveSwift
//
//  Created by tom on 16/5/27.
//  Copyright © 2016年 iceesj. All rights reserved.
//

import UIKit

class Classes_New: UIViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //空类
        let newclass = NewClass()
        print("newclass = \(newclass)")
        
        print("value1 = \(newclass.value1)")
        print("value2 = \(newclass.value2)")
        print("value3 = \(newclass.value3)")
        
        print("修改前 = \(newclass.value)")
        newclass.value = "Swift"
        print("修改后 = \(newclass.value)")
        
        
        //延迟属性
        let manager = NewClass2()
        manager.data += ["Some more data"]
        print("manager.data = \(manager.data)")
        print("manager.importer.fileName = \(manager.importer.fileName)")
        
        
        //计算属性
        let degreeClass = DegreeClass()
        degreeClass.cal = (100.0)
        print("degreeClass = \(degreeClass.cal)")
        print("degreeClass = \(degreeClass.degree)")
        
        
    }

}

class NewClass{
    let value1 = 500
    let value2 = 50.00
    let value3 = "Hello"
    
    var value : String = "Hello"
}

class NewClass1{
    var fileName = 8
}

class NewClass2{
    lazy var importer = NewClass1()
    var data = [String]()
    
}

//华氏摄氏转换
class DegreeClass{
    var degree = 0.0
    //计算属性
    var cal : Double {
        get {
            let centigradedegree = (degree-32)/1.0
            return centigradedegree
        }
        set(centigradedegree){
            degree = 1.0*centigradedegree+32
        }
    }
}

class StepCounter{
    var totalSteps : Int = 0{
        willSet(newTotalSteps){
            print("新的值为 \(newTotalSteps)")
        }
        didSet(old){
            if totalSteps > old {
                
            }
        }
    }
}





