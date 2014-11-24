//
//  CSJSwiftRequest.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-12.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
import Foundation


class CSJSwiftRequest: NSObject {
    
    enum CSJSwiftRequestMethod{
        case GET
        case PUT
        case POST
        case DELETE
        
        func description()->NSString {
            switch self{
            case .GET:
                return "GET"
            case .PUT:
                return "PUT"
            case .POST:
                return "POST"
            case .DELETE:
                return "DELETE"
            }
        }
    }
    
    var method:CSJSwiftRequestMethod!
    var hearders : NSDictionary?
    var parameters: NSDictionary?
    
    override init()
    {
        super.init();
    }
    
    
    //同步NSURLConnection
    class func requestSynchronousWithURL(urlString:String,completionHandler:(data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        var URL = NSURL(string: urlString)
        var req = NSURLRequest(URL: URL!)
        var httpResponse: NSURLResponse? = nil
//    class func sendSynchronousRequest(request: NSURLRequest!, returningResponse response: AutoreleasingUnsafePointer<NSURLResponse?>, error: NSErrorPointer) -> NSData!
        var responseData = NSURLConnection.sendSynchronousRequest(req,returningResponse:&httpResponse,error:nil)
        //before xcode6 beta6
//        if responseData{
        if (responseData != nil){
            let jsonData = NSJSONSerialization.JSONObjectWithData(responseData!, options:NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
            completionHandler(data:jsonData)
        }else{
            println("同步请求错误")
        }
        
    }
    
    
    //异步NSURLConnection
    class func requestWithURL(urlString:String,completionHandler:(data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        var URL = NSURL(string: urlString)
        var req = NSURLRequest(URL: URL!)
        var queue = NSOperationQueue();
//        + (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: {
            response, data, error in
            //xcode6 beta6 change
//            if error {
            if (error != nil) {
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
    
    //异步NSURLSession
    class func requestWithURLbyiOS7Later(urlString:String, completionHandler:(data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        var URL = NSURL(string: urlString)
        var req = NSURLRequest(URL: URL!)
        var dict : NSDictionary?
        var session = NSURLSession.sharedSession()
//        func dataTaskWithRequest(request: NSURLRequest!, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask!
        session.dataTaskWithRequest(req ,completionHandler:{
            data, response, error in
            //xcode6 beta6
//            if (error){
            if (error != nil){
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
        //Xcode6 beta5
        if error != nil {
            NSLog("Error parsing JSON")
        }
        return dictJSON
    }
    
}
