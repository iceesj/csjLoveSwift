//
//  AppDelegate.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-3.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
//        MagicalRecord.setupAutoMigratingCoreDataStack()
//        MagicalRecord.setupCoreDataStackWithAutoMigratingSqliteStoreNamed("csjLoveSwift.sqlite")

        fenleiDataIntoDocument()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
}

//test return Array
func fenleiDataResource() -> Array<AnyObject>{
//    var dictArray = Array<Dictionary<String,String>>()
    var dictArray = [Dictionary<String, String>]()
    var dict1 = ["firstName":"曹","lastName":"操","onlyID":"001"]
    var dict2 = ["firstName":"张","lastName":"飞","onlyID":"002"]
    dictArray = [dict1,dict2]
    println("dictArray = \(dictArray)")
    return dictArray
}

//init and save data
func fenleiDataIntoDocument() {
//    var dictArray = fenleiDataResource()
    var dictArray = [Dictionary<String, String>]()
    var dict1 = ["firstName":"曹","lastName":"操","onlyID":"001"]
    var dict2 = ["firstName":"张","lastName":"飞","onlyID":"002"]
    dictArray = [dict1,dict2]
//        Testperson.MR_importFromArray(dictArray)
//    MagicalRecord.saveWithBlock({ (NSManagedObjectContext) -> Void in
    
//    }, completion: { (Bool, NSError) -> Void in
    
//    })
    /*
    //method1
    let testperson : Testperson = Testperson.MR_createEntity() as Testperson
    for (index, value) in enumerate(dictArray) {
        var item = dictArray[index]
        println("item = \(item)")
        testperson.testpersonID = item["onlyID"]
        testperson.lastName  = item["lastName"]
        testperson.firstName = item["firstName"]
        NSManagedObjectContext.MR_contextForCurrentThread().MR_saveToPersistentStoreAndWait()
    }
    */
    
    //bug bug bug
    //mr
    /*
    //MR_CSJ
    var ttP:Testperson?
    ttP = Testperson.MR_findFirstByAttribute("testpersonID", withValue:ttP?.testpersonID)
    if (nil == ttP) {
        ttP = Testperson.MR_createEntity()
        for (index, value) in enumerate(dictArray){
            var item = dictArray[index]
            ttP!.testpersonID = item["onlyID"]
            ttP!.lastName  = item["lastName"]
            ttP!.firstName = item["firstName"]
            NSManagedObjectContext.defaultContext().MR_saveToPersistentStoreAndWait()
        }
    }
    */
    
//        Testperson.MR_importFromArray(dictArray)
//    testperson.managedObjectContext.MR_saveToPersistentStoreAndWait()

}
