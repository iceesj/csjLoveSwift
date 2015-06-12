//
//  SecondNavViewController.swift
//  csjLoveSwift
//
//  Created by 曹 盛杰 on 15/1/31.
//  Copyright (c) 2015年 iceesj. All rights reserved.
//

import UIKit

let zcTabBarSecondString : String = "Location"
let zcTabBarSecondSelectedString : String = "LocationSelected"

class SecondNavViewController: UINavigationController {
    override func awakeFromNib() {
        super.awakeFromNib()
        //swift 1.1
        self.tabBarItem.image = UIImage(named: zcTabBarSecondString)?.imageWithRenderingMode(.AlwaysOriginal)
        self.tabBarItem.selectedImage = UIImage(named: zcTabBarSecondSelectedString)?.imageWithRenderingMode(.AlwaysOriginal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var version: NSString = UIDevice.currentDevice().systemVersion;
        if version.intValue > 7 {
            //            print("设备高于iOS7 \(version)")
            UITabBar.appearance().translucent = false
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
