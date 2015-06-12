//
//  SecondTableViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-8-25.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class SecondTableViewController: CSJFetchedResultsTableViewController {
    
    var coredataTestperson = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        setupFetchedResultsController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFetchedResultsController()
//        coredataTestperson = Testperson.MR_findAll()
//        print("coredataTestperson = \(coredataTestperson)")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
//    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
//        return 0
//    }
    
//    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
    
    
    //MR_CSJ
    func setupFetchedResultsController() {
//        var resultPredicate = NSPredicate(format: "firstName != nil")
//        self.fetchedResultsController = Testperson.fetchAllGroupedBy(nil, withPredicate: resultPredicate, sortedBy:"testpersonID", ascending: true)
    }
    
    //xcode beta7
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as! UITableViewCell
        //MR_CSJ
        /*
        let testperson = fetchedResultsController.objectAtIndexPath(indexPath) as Testperson
        cell.textLabel.text = testperson.firstName
        */
        cell.textLabel?.text = "1"
        return cell
    }
    //xcode beta6
//    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    // MARK: - Table view data source
    //    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    //        return 0
    //    }
    
    //    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    //        return 0
    //    }
//    func setupFetchedResultsController() {
//        var resultPredicate = NSPredicate(format: "firstName != nil")
//        self.fetchedResultsController = Testperson.fetchAllGroupedBy(nil, withPredicate: resultPredicate, sortedBy:"testpersonID", ascending: true)
//    }
    
    //xcode beta7
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
//        let cell = tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as UITableViewCell
//        let testperson = fetchedResultsController.objectAtIndexPath(indexPath) as Testperson
//        cell.textLabel.text = testperson.firstName
//        cell.textLabel!.text = testperson.firstName
//        return cell
//    }
    /*
    //xcode beta6
    //    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    //xcode beta7
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    */
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}






