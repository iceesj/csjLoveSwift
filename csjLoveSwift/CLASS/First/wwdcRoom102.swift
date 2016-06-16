//
//  wwdcRoom102.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-3.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class wwdcRoom102: CSJSwiftViewController {
    
    //Xcode6 beta5
    /*
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    */
    
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
        func sum(_ array:[Int])->Int{
            var result = 0
            for value in array {result += value}
            print("result = \(result)")
            return result
        }
        var resultsum = sum(specialNumbers)
        print("resultsum = \(resultsum)")
        func sumAndAverage(_ array:[Int ]) -> (sum:Int, average:Double){
            var result = 0
            for value in array {result += value}
            let avg = Double(result) / Double(array.count)
            return (result, avg)
        }
        
        //Swift 2 去除没有使用的
//        var result = sumAndAverage(specialNumbers)
        let rect = CGRect(x: 10.0, y: 5.0, width: 10.0, height: 10.0)
        let sameRect = CGRect(x:10.0, y:5.0, width:10.0, height: 10.0)
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
