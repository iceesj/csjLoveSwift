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
        // Do any additional setup after loading the view, typically from a nib.
        println("Hello Swift" + "im csj")
        
        great("dev", day: "wwdc day")
        
        
    }

    //传入方法输出
    func great(name: String,day :String){
        println( "Hello \(name),today is\(day)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
    
    */

}

