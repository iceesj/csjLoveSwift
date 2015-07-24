//
//  TestBeta5ViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-8-5.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class TestBeta5ViewController: UIViewController {
    
    //Xcode6 beta5
    ///*
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    //Xcode6 beta6
//    required init(coder aDecoder: NSCoder) {
    //Xcode7 beta4
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
