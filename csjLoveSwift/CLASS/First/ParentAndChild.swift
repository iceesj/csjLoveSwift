//
//  ParentAndChild.swift
//  csjLoveSwift
//
//  Created by iceesj on 2024/4/18.
//  Copyright © 2024 iceesj. All rights reserved.
//

import Foundation

class ParentAndChild : CSJSwiftViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "父类和子类"
        let childInstance = ChildClass()
        childInstance.parentMethod()
        childInstance.childMethod()
        print(childInstance.parentProperty)
        print(childInstance.childProperty)
    }
}

// 定义一个父类（基类）
class ParentClass {
    var parentProperty: String = "From the parent"
    func parentMethod() {
        print("This is a method in the parent class. -1")
    }
}

class ChildClass: ParentClass {
    // 新增子类特有的属性
    var childProperty: String = "From the child"
    
    override func parentMethod() {
        super.parentMethod()
        print("This is an overridden method in the child class.-2")
    }
    
    func childMethod () {
        print("This is a method unique to the child class.-3")
    }
}


