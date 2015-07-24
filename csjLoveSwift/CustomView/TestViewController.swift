//
//  TestViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-4.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    //Xcode6 beta5
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
    
    //Xcode6 beta5 beta6
//    required init(coder aDecoder: NSCoder)  {
    //Xcode7 beta4,Swift 2
    required init?(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
