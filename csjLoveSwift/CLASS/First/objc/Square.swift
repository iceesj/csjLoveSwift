//
//  Square.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-2.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class Square: NamedShape {
    var sideLength : Double
    
    //构造函数
    init (sideLength: Double , name: String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    
    //方法
    func area()-> Double{
        return sideLength * sideLength
    }
    
    //重写方法
    override func simpleDescription() -> String{
        return "A square with sides of length \(sideLength)"
    }
    
}
