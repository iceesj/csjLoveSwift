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
        
        println("Hello Swift" + "im csj")
        //methods
        great("dev", day: " wwdc day")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOnePressed(sender : AnyObject) {
        let vc = self.storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as FirstViewController
        self.navigationController.pushViewController(vc,animated:true)
    }
    //传入方法输出
    func great(name: String,day :String){
        println( "Hello \(name),today is\(day)")
    }
    
    



}

