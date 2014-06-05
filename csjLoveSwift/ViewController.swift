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
        testMethod()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOnePressed(sender : AnyObject) {
        let vc = self.storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as FirstViewController
        self.navigationController.pushViewController(vc,animated:true)
    }
    
    
    func testMethod () {
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
        println(components)
        
        //arr
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        println(shoppingList)
        
        //dict
        var dict = ["dict1":"nicai","dict2":"nicai2",]
        println(dict)
        
    }
    
    //传入方法输出
    func great(name: String,day :String){
        println( "Hello \(name),today is\(day)")
    }
    
    



}

