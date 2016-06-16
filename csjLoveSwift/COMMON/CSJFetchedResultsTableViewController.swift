//
//  CSJFetchedResultsTableViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-8-22.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
import CoreData

//UITableViewRowAnimation.Fade，，UITableViewRowAnimation.None
let CSJSwift_UITableViewRowAnimation = UITableViewRowAnimation.fade

class CSJFetchedResultsTableViewController: UITableViewController , NSFetchedResultsControllerDelegate {
    //iOS7，iOS8 Swift NSFetchedResultsController Tableview
    var changeIsUserDriven = false
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> = NSFetchedResultsController() {
        didSet {
            if (fetchedResultsController != oldValue) {
                fetchedResultsController.delegate = self;
//                if (fetchedResultsController.isKindof: NSFetchedResultsController) {
//                    self.performFetch()
//                } else {
                    self.tableView.reloadData()
//                }
            }
        }
    }
    
    func performFetch(){
//        if (self.fetchedResultsController.isKindof: NSFetchedResultsController){
        /*
            var error : NSError!
            var success = self.fetchedResultsController.performFetch(&error)
            if (success) {
                print("Success")
            } else {
                print("Failed")
            }
        */
//        }
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
    override func numberOfSections(in tableView: UITableView) -> Int {
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //MR_CSJ
//        return fetchedResultsController.sections!.count
        return 1
    }
    
    //xcode6 beta7
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //MR_CSJ
//        var rows = 0
//        if (fetchedResultsController.sections!.count > 0){
//            rows = fetchedResultsController.sections![section].numberOfObjects
//        }
//        return rows
        return 1
    }
    /*
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
    */
//    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
//        return fetchedResultsController.sections[section].name?
//    }
    
//    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
//        return fetchedResultsController.sections[section].name?
//    }
    
//NSFetchedResultsControllerDelegate
    
    //20150603 修改fetchedResultsController
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    
    //http://stackoverflow.com/questions/24983228/xcode-6-beta-4-use-of-unresolved-identifier-nsfetchedresultschangeinsert
    
    //Swift3
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
    //Swift2.2
//    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            self.tableView.insertSections(IndexSet(integer: sectionIndex), with: CSJSwift_UITableViewRowAnimation)
            break
            
        case .delete:
            self.tableView.deleteSections(IndexSet(integer: sectionIndex), with: CSJSwift_UITableViewRowAnimation)
            break
            
        default:
            break
        }
    }
    
    //Swift 3
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: AnyObject, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    //Swift 2.1
//    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    //Swift 2
//    func controller(controller: NSFetchedResultsController, didChangeObject anObject: NSManagedObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    //Swift 1.2
//    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    //Swift 1
//    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath : NSIndexPath!) {
        switch type {
        case .insert:
            self.tableView.insertRows(at: [indexPath!], with: CSJSwift_UITableViewRowAnimation)
            break
        case .delete:
            self.tableView.deleteRows(at: [indexPath!], with: CSJSwift_UITableViewRowAnimation)
            break
        case .update:
            self.tableView.reloadRows(at: [indexPath!], with: CSJSwift_UITableViewRowAnimation)
            break
        case .move:
            self.tableView.deleteRows(at: [indexPath!], with: CSJSwift_UITableViewRowAnimation)
            self.tableView.insertRows(at: [indexPath!], with: CSJSwift_UITableViewRowAnimation)
            break
//        default:
//            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
//    func controllerDidChangeContent(controller: NSFetchedResultsController){
//        self.tableView.endUpdates()
        UIView.setAnimationsEnabled(false)
        self.tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
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
