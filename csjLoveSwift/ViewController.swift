//
//  ViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttonOne : UIButton
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController"
        buttonOne.setTitle("FirstVC",forState: .Normal)
        
        
        //methods
        great("dev", day: " wwdc day")
        
        myTestMethod()
        
        wwdcRoom102()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOnePressed(sender : AnyObject) {
        let vc = self.storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as FirstViewController
        self.navigationController.pushViewController(vc,animated:true)
    }
    
    /**
    Method
    */
    
    //传入方法输出
    func great(name: String,day :String){
        println( "Hello \(name),today is\(day)")
    }
    
    func myTestMethod () {
        println("Hello Swift" + "im csj")
        
        var languageName1:String = "Swift" //inferred as String
        var version1:Double = 1.0 //inferred as double
        var introduced1:Int = 2014 //inferred as int
        var isAwesome1:Bool = true// inferred as bool
        
        let languageName = "Swift"
        var version = 1.0
        let introduced = 2014
        let isAwesome = true
        
        let 你猜 = "你猜"
        let 😄 = "smile"
        println(你猜+😄)
        
        let components = "~/Documents/Swift".pathComponents
        println("components = \(components)")
        
        //arr
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        println("数组 \(shoppingList)")
        shoppingList.removeLast()
        println("数组 \(shoppingList)")
        //遍历数组
        for number in shoppingList{
            println("i like \(number).")
        }
        
        
        //dict
        var dict = ["Earth":"1.0","Mars":"1.524"]
        println("输出dict = \(dict)")
        for (planet, distance) in dict{
            println("The planet \(planet) is \(distance) AUs from the sun.")
        }
        
    }
    
    
    func wwdcRoom102(){
        var specialWords = ["klaatu","barada","nikto"]
        var specialNumbers = [4,8,15,16,23,42]
        func sum(array:Int[])->Int{
            var result = 0
            for value in array {result += value}
            println("result = \(result)")
            return result
        }
        var resultsum = sum(specialNumbers)
        println("resultsum = \(resultsum)")
        func sumAndAverage(array:Int[]) -> (sum:Int, average:Double){
            var result = 0
            for value in array {result += value}
            var avg = Double(result) / Double(array.count)
            return (result, avg)
        }
        var result = sumAndAverage(specialNumbers)
        
//        var sysFont : NSFont = NSFont.systemFontOfSize(0)
        var rect = CGRectMake(10.0, 5.0, 10.0, 10.0)
        var sameRect = CGRect(x:10.0, y:5.0, width:10.0, height: 10.0)
//        extension CGRect{
//            var area:Double {return width *height}
//        }
        
    }



}

