//
//  NamedShape.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-2.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class NamedShape {
    var numberOfSides :Int = 0
    var name : String
    
    init (name : String){
        //self用来区别实例变量
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
