//
//  AdvancedOperators.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
//高级运算符
class AdvancedOperators: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "高级运算符"
        advancedOperatorsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func advancedOperatorsMethod(){
        println("----高级运算符----")
        
        //按位运算符，Bitwise Operators
        //按位取反： ~  ,按位与运算：& ,按位或运算：|
        //按位异或运算：^ ,按位左移运算： << ,按位右移动运算： >>
        
        //溢出运算符
        //自从swift里面提供了类型安全之后，就不能再用一个Int.max进行+1操作。
        //swift又提供了一个让我们知道会溢出，继续+1的运算符
        //溢出加法 &+ ,减 &- ,乘 &* ,除 &/,余 &%
        //如果一个数被0除，会产生错误，在swift中，溢出除法 &% 被0除的话，就不会产生错误，得到0值。
        var potentialOverflow = Int16.max
        //potentialOverflow = 32767, which is the largest value an Int16 can hold
        potentialOverflow &+ 1
        
//        var a = Int.max /0 //报错
        var b = Int.max &/ 0
        
        var willOverflow = UInt8.max
        willOverflow = willOverflow &+ 1
        // willOverflow is now equal to 0
        
        var willUnderflow = UInt8.min
        willUnderflow = willUnderflow &- 1
        //10000000
        //willUnderflow is now equal to 255
        
        
        
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

struct Vector2D {
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}
