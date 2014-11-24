//
//  NavGestureViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-12.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class NavGestureViewController: UINavigationController,UIGestureRecognizerDelegate {
    //Xcode6 beta5 beta6
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    //Xcode6 beta5
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
