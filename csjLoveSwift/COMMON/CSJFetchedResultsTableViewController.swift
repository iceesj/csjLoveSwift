//
//  CSJFetchedResultsTableViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-8-22.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
import CoreData

//UITableViewRowAnimation.Fade，，UITableViewRowAnimation.None
let CSJSwift_UITableViewRowAnimation = UITableViewRowAnimation.Fade

class CSJFetchedResultsTableViewController: UITableViewController , NSFetchedResultsControllerDelegate {
    //iOS7，iOS8 Swift NSFetchedResultsController Tableview
    var changeIsUserDriven = false
    
    var fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController() {
        didSet {
            if (fetchedResultsController != oldValue) {
                fetchedResultsController.delegate = self;
                if (fetchedResultsController.isKindOfClass(NSFetchedResultsController)) {
                    self.performFetch()
                } else {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func performFetch(){
        if (self.fetchedResultsController.isKindOfClass(NSFetchedResultsController)){
            var error : NSError?
            var success = self.fetchedResultsController.performFetch(&error)
            if (success) {
                println("Success")
            } else {
                println("Failed")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    //xcode6 beta6
    /*
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return fetchedResultsController.sections.count
    }
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    var rows = 0
    //xcode beta7
    if (fetchedResultsController.sections.count > 0){
    rows = fetchedResultsController.sections[section].numberOfObjects
    }
    return rows
    }
    */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    //xcode6 beta7
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if (fetchedResultsController.sections!.count > 0){
            rows = fetchedResultsController.sections![section].numberOfObjects
        }
        return rows
    }
    
//    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
//        return fetchedResultsController.sections[section].name?
//    }
    
//NSFetchedResultsControllerDelegate
    func controllerWillChangeContent(controller: NSFetchedResultsController!) {
        if (!changeIsUserDriven){
            self.tableView.beginUpdates()
        }
    }
    
    
    //http://stackoverflow.com/questions/24983228/xcode-6-beta-4-use-of-unresolved-identifier-nsfetchedresultschangeinsert
    
    func controller(controller: NSFetchedResultsController!, didChangeSection sectionInfo: NSFetchedResultsSectionInfo!, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        if (!changeIsUserDriven){
            switch type {
            case .Insert:
                self.tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: CSJSwift_UITableViewRowAnimation)
                break
                
            case .Delete:
                self.tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: CSJSwift_UITableViewRowAnimation)
                break
                
            default:
                break
            }
        }
    }
    
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath : NSIndexPath!) {
        if (!changeIsUserDriven)
        {
            switch type {
            case .Insert:
                self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: CSJSwift_UITableViewRowAnimation)
                break;
                
            case .Delete:
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: CSJSwift_UITableViewRowAnimation)
                break;
                
            case .Update:
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: CSJSwift_UITableViewRowAnimation)
                break;
                
            case .Move:
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: CSJSwift_UITableViewRowAnimation)
                self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: CSJSwift_UITableViewRowAnimation)
                break;
                
            default:
                break
            }
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!)
    {
        if (!changeIsUserDriven) {
            self.tableView.endUpdates()
        }
    }
    
    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
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
