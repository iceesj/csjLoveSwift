//
//  CSJSwiftRequest.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-12.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
import Foundation


class CSJSwiftRequest: NSObject {
    init()
    {
        super.init();
    }
    
    //异步
    class func requestWithURL(urlString:String,completionHandler:(data:AnyObject)->Void){
        var URL = NSURL.URLWithString(urlString)
        var req = NSURLRequest(URL: URL)
        var queue = NSOperationQueue();
//        + (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler
        //异步
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: {
            response, data, error in
            if error{
                dispatch_async(dispatch_get_main_queue(),{
                    println(error)
                    completionHandler(data:NSNull())
                })
            }else{
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler(data:jsonData)
                })
            }
        })
    }
    
    //异步
    class func requestWithURLbyiOS7Later(urlString:String, completionHandler:(data:AnyObject)->Void){
        var URL = NSURL.URLWithString(urlString)
        var req = NSURLRequest(URL: URL)
        var dict : NSDictionary?
        var session = NSURLSession.sharedSession()
//        func dataTaskWithRequest(request: NSURLRequest!, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask!
        session.dataTaskWithRequest(req ,completionHandler:{
            data, response, error in
            if (error){
                dispatch_async(dispatch_get_main_queue(),{
                    println(error)
                    completionHandler(data:NSNull())
                })
            }else{
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler(data:jsonData)
                })
            }
        }).resume()
    }
    
    //解析JSON
    class func parseJSON(inputData:NSData) -> NSDictionary{
        var error:NSError?
//NSJSONReadingOptions.MutableLeaves,,NSJSONReadingOptions.MutableContainers
        var dictJSON:NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options:NSJSONReadingOptions.MutableLeaves, error:&error) as NSDictionary
        if error {
            NSLog("Error parsing JSON")
        }
        return dictJSON
    }
    
}
