//
//  wwdcRoom102.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class wwdcRoom102: CSJSwiftViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "wwdcRoom102"
        
//        wwdcRoom102()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///*
    func wwdcRoom102(){
        var specialWords = ["klaatu","barada","nikto"]
        var specialNumbers = [4,8,15,16,23,42]
        //Xcode6 beta3
        func sum(array:[Int])->Int{
            var result = 0
            for value in array {result += value}
            println("result = \(result)")
            return result
        }
        var resultsum = sum(specialNumbers)
        println("resultsum = \(resultsum)")
        func sumAndAverage(array:[Int ]) -> (sum:Int, average:Double){
            var result = 0
            for value in array {result += value}
            var avg = Double(result) / Double(array.count)
            return (result, avg)
        }
        var result = sumAndAverage(specialNumbers)
        var rect = CGRectMake(10.0, 5.0, 10.0, 10.0)
        var sameRect = CGRect(x:10.0, y:5.0, width:10.0, height: 10.0)
        if rect == sameRect{
            NSLog("rect = sameRect")
        }
        //        extension CGRect{
        //            var area:Double {return width *height}
        //        }
        
    }
    //*/
    
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
