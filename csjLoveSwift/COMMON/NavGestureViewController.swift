//
//  NavGestureViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-12.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class NavGestureViewController: UINavigationController,UIGestureRecognizerDelegate {
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}