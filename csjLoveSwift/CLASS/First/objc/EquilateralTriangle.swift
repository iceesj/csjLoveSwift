//
//  EquilateralTriangle.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-2.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class EquilateralTriangle: NamedShape {
    //1 设置子类声明的属性值
    var sideLength: Double = 0.0
    
    var perimeter : Double{
        get {
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        //2 调用父类的构造器
        super.init(name:name)
        numberOfSides = 3
    }
    //3 改变父类方法
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)"
    }
    
}

