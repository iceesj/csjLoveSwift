//
//  CurryingVC.swift
//  csjLoveSwift
//
//  Created by tom on 16/5/30.
//  Copyright © 2016年 iceesj. All rights reserved.
//

import UIKit

//柯里化实验
class CurryingVC: UIViewController {
    
    var curryInstance = Currying()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Swift3beta4
        self.view.backgroundColor = UIColor.white
        
        let result: Int = curryInstance.add(10)(20)(30)
        print("result = \(result)")
        
        // 让我来帮你们拆解下，更容易看懂
        // curryInstance.add(10): 调用一个接收参数a,并且返回一个接收参数b的函数,并且这个函数又返回一个接收参数c,返回值为Int类型的函数
        // functionB: 一个接收参数b的函数,并且这个函数又返回一个接收参数c,返回值为Int类型的函数
        let functionB = curryInstance.add(10)
        print("functionB = \(functionB)")
        // functionB(b: 20):调用一个接收参数b的函数,并且这个函数又返回一个接收参数c,返回值为Int类型的函数
        // functionC: 一个接收参数c,返回值为Int类型的函数
        let functionC = functionB(20)
        print("functionC = \(functionC)")
        // functionC(c: 30): 调用一个接收参数c,返回值为Int类型的函数
        // result: 函数的返回值
        let res: Int = functionC(30)
        print("res = \(res)")
        
        //Swift3
        let funcB = curryInstance.addCur(30,30,30)
        print("funcB = \(funcB)")
        //Swift2.2
        /*
        let funcB = curryInstance.addCur(30)
        print("funcB = \(funcB)")
        let funcC = funcB(30)
        print("funC = \(funcC)")
        let res2 : Int = funcC(c: 30)
        print("res2 = \(res2)")
        */
        
//        curryInstance.function()
        
        //调用function方法
        Currying.function(curryInstance)()
        //拆解调用function方法
        //获取function方法
        let function = Currying.function(curryInstance)
        function()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func addCur(_ a: Int, b: Int, c: Int) -> Int{
        print("\(a) + \(b) + \(c)")
        return a + b + c
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



class Currying
{
    func function(){
        print("function = \(#function)")
    }
    
    func functionParam(_ a: Int){
        print("functionParam = \(#function)")
    }
    
    func functionParam(_ a: Int, b : Int){
        print(#function)
    }
    
//    func functionCur(a : Int)(){
//        print(#function)
//    }
    
    /*** uncurried:普通函数 ***/
    // 接收多个参数的函数
    func add(_ a: Int, b: Int, c: Int) -> Int{
        print("\(a) + \(b) + \(c)")
        return a + b + c
    }
    
    /*** 手动实现柯里化函数 ***/
    // 把上面的函数转换为柯里化函数，首先转成接收第一个参数a，并且返回接收余下第一个参数b的新函数（采用闭包）
    // 为了让大家都能看懂,我帮你们拆解来看下
    // (a: Int) : 参数
    // (b:Int) -> (c: Int) -> Int : 函数返回值（一个接收参数b的函数,并且这个函数又返回一个接收参数c,返回值为Int类型的函数)
    // 定义一个接收参数a,并且返回一个接收参数b的函数,并且这个函数又返回一个接收参数c,返回值为Int类型的函数
    func add(_ a: Int) -> (_ b:Int) -> (_ c: Int) -> Int{
        // 一个接收参数b的函数,并且这个函数又返回一个接收参数c,返回值为Int类型的函数
        return { (b:Int) -> (_ c: Int) -> Int in
            // 返回一个接收余下第一个参数c，并且有返回结果为Int类型的函数
            return { (c: Int) -> Int in
                return a + b + c;
                /*
                注解： 这里为什么能使用参数a,b,c?
                利用闭包的值捕获特性，即使这些值作用域不在了，也可以捕获到他们的值。
                闭包会自动判断捕获的值是值拷贝还是值引用，如果修改了，就是值引用，否则值拷贝。
                注意只有在闭包中才可以，a,b,c都在闭包中。
                */
            }
        }
    }
    
    /*** curried: 系统自带的柯里化函数 ***/
    func addCur(_ a: Int, _ b: Int, _ c: Int) -> Int{
        print("\(a) + \(b) + \(c)")
        return a + b + c
    }
}


protocol CombineUI{
    func combine (_ top: () -> (), bottom: () -> ())
    
}

class UI: CombineUI {
    func combine(_ top: () -> (), bottom: () -> ()) {
        top()
        
        bottom()
    }
}



