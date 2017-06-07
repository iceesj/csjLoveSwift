//
//  AppDelegate.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-3.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    //Swift3beta6
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
//        MagicalRecord.setupAutoMigratingCoreDataStack()
//        MagicalRecord.setupCoreDataStackWithAutoMigratingSqliteStoreNamed("csjLoveSwift.sqlite")
        
        fenleiDataIntoDocument()
        
        
        UINavigationBar.appearance().barTintColor? = UIColor(red: 174/255.0, green: 7/255.0, blue: 22/255, alpha: 1.0);
        
        //Swift3beta4
        UITabBar.appearance().barTintColor = UIColor.white
        //Nav字体颜色 全局
        //Swift3 ： NSForegroundColorAttributeName，Swift 4：NSAttributedStringKey.foregroundColor.rawValue
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue:UIColor(red: 174/255.0, green: 7/255.0, blue: 22/255, alpha: 1.0)]
//        UITabBar.appearance().backgroundImage? = self.image
        //Swift3beta4
        UITabBar.appearance().backgroundColor? = UIColor.blue
        //Swift3beta4
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor.rawValue : UIColor.black], for: UIControlState())
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor.rawValue : UIColor(red: 174/255.0, green: 7/255.0, blue: 22/255, alpha: 1)], for: UIControlState.selected)
        
        
        return true
    }
    
//    func imageWithColor(color : UIColor, size : CGSize) -> UIImage?{
//    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
}

//test return Array
///*

//Array<AnyObject>
func fenleiDataResource() -> [Dictionary<String,String>]{
//    var dictArray = Array<Dictionary<String,String>>()
    var dictArray = [Dictionary<String, String>]()
    let dict1 = ["firstName":"曹","lastName":"操","onlyID":"001"]
    let dict2 = ["firstName":"张","lastName":"飞","onlyID":"002"]
    dictArray = [dict1,dict2]
    print("dictArray = \(dictArray)")
    return dictArray
}
//*/

//init and save data
func fenleiDataIntoDocument() {
//    var dictArray = fenleiDataResource()
    var dictArray = [Dictionary<String, String>]()
    print("dictArray1 = \(dictArray)")
    
    let dict1 = ["firstName":"曹","lastName":"操","onlyID":"001"]
    let dict2 = ["firstName":"张","lastName":"飞","onlyID":"002"]
    dictArray = [dict1,dict2]
    
    print("dictArray2 = \(dictArray)")
//        Testperson.MR_importFromArray(dictArray)
//    MagicalRecord.saveWithBlock({ (NSManagedObjectContext) -> Void in
    
//    }, completion: { (Bool, NSError) -> Void in
    
//    })
    /*
    //method1
    let testperson : Testperson = Testperson.MR_createEntity() as Testperson
    for (index, value) in enumerate(dictArray) {
        var item = dictArray[index]
        print("item = \(item)")
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
