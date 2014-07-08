//
//  FirstBetaViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-8.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit

class FirstBetaViewController: UITableViewController {
    var baseArray = ["wwdcRoom102","基础","运算符","字符和字符串","集合类型","控制流[控制语句]","函数","闭包","枚举","类和结构体","属性","方法","下标","继承","构造过程","析构过程ARC","可选链","类型转换、嵌套类型","扩展","协议","泛型","高级运算符",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FirstViewController"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return baseArray.count
    }
    
    //Xcode beta1 and beta2
//    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
    //Xcode beta3
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
//        let cell = tableView?.dequeueReusableCellWithIdentifier("firstCell", forIndexPath: indexPath) as UITableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("firstCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = baseArray[indexPath!.row]
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        var data = baseArray[indexPath!.row]
        if (data == "wwdcRoom102"){
            var wwdcVC = wwdcRoom102(nibName :nil, bundle: nil)
            self.navigationController.pushViewController(wwdcVC, animated: true)
        }
        else if (data == "字符和字符串"){
            var StringVC = SwiftString(nibName: nil,bundle: nil)
            self.navigationController.pushViewController(StringVC, animated: true)
        }
        else if (data == "集合类型"){
            var commentsVC = ArrayAndDict(nibName :nil, bundle: nil)
            self.navigationController.pushViewController(commentsVC, animated: true)
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
