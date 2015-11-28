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
        let URL = NSURL(string: urlString)
        let req = NSURLRequest(URL: URL!)
        var httpResponse: NSURLResponse? = nil
//    class func sendSynchronousRequest(request: NSURLRequest!, returningResponse response: AutoreleasingUnsafePointer<NSURLResponse?>, error: NSErrorPointer) -> NSData!
        
        do {
            let responseData = try NSURLConnection.sendSynchronousRequest(req, returningResponse: &httpResponse)
            if responseData != NSNull() {
                
                do {
                    let jsonData : NSDictionary = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                    completionHandler(data: jsonData)
                } catch {
                    print("同步请求回的Data出错")
                }
                
            }else{
                
            }
        } catch {
            print("同步请求出错")
        }
        
        //Swift 1.2
        /*
        var responseData = NSURLConnection.sendSynchronousRequest(req, returningResponse:&httpResponse, error:nil)
        if (responseData != nil){
            //20150603
            let jsonData: AnyObject? = NSJSONSerialization.JSONObjectWithData(responseData!, options:NSJSONReadingOptions.MutableLeaves, error: nil)
            completionHandler(data:jsonData!)
        }else{
            print("同步请求错误")
        }
        */
        
    }
    
    
    //异步NSURLConnection
    class func requestWithURL(urlString:String,completionHandler:(data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        let URL = NSURL(string: urlString)
        let req = NSURLRequest(URL: URL!)
        let queue = NSOperationQueue();
//        + (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: {
            response, data, error in
            //xcode6 beta6 change
//            if error {
            if (error != nil) {
                dispatch_async(dispatch_get_main_queue(),{
                    print(error)
                    completionHandler(data:NSNull())
                })
            }else{
                //Swift 1.2
                /*
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableLeaves, error: nil) as! NSDictionary
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler(data:jsonData)
                })
                */
                
                //Swift 2
                do {
                    let jsonData : NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionHandler(data: jsonData)
                    })
                } catch {
                    print("An error occurred. = requestWithURL")
                }
            }
        })
    }
    
    //异步NSURLSession
    class func requestWithURLbyiOS7Later(urlString:String, completionHandler:(data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        let URL = NSURL(string: urlString)
        let req = NSURLRequest(URL: URL!)
//        let dict : NSDictionary?
//        var session = NSURLSession.sharedSession()
//        func dataTaskWithRequest(request: NSURLRequest!, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask!
        NSURLSession.sharedSession().dataTaskWithRequest(req) { (dataA, response, error) -> Void in
            print("异步")
            if error != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    print(error)
                    completionHandler(data: NSNull())
                })
            }else{
                //Swift 1.2
                /*
                var jsonData: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataA!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completionHandler(data: jsonData)
                })
                */
                
                //Swift 2
                do {
                    let jsonData : NSDictionary = try NSJSONSerialization.JSONObjectWithData(dataA!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        completionHandler(data: jsonData)
                    })
                } catch{
                    print("An error occurred. = parseJSON")
                }

                
            }
        }
        /*
        session.dataTaskWithRequest(req ,completionHandler:{
            data, response, error in
            //xcode6 beta6
//            if (error){
            if (error != nil){
                dispatch_async(dispatch_get_main_queue(),{
                    print(error)
                    completionHandler(data:NSNull())
                })
            }else{
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableLeaves, error: nil) as! NSDictionary
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler(data:jsonData)
                })
            }
        }).resume()
        */
        
    }
    
    //解析JSON
    class func parseJSON(inputData : NSData) -> NSDictionary{
        //Swift 1.2
        /*
        var error : NSError!
//NSJSONReadingOptions.MutableLeaves,,NSJSONReadingOptions.MutableContainers
        let dictJSON : NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options:NSJSONReadingOptions.MutableLeaves, error: &error) as! NSDictionary
        if error != nil {
            NSLog("Error parsing JSON")
        }
        return dictJSON
        */
        
        let dictJson : NSDictionary!
        //Swift 2
        ///*
        do {
            dictJson = try NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
            print("Success")
            return dictJson
//            try NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers)
        } catch {
            print("An error occurred. = parseJSON")
            return ["cc":"出错"]
        }
        //*/
    }
    
    
    
}

/*
enum MyError: ErrorType {
    case UserError
    case NetworkError
    case DiscoverydError
}

func doStuff() throws -> String {
    print("Do stuff 1")
    print("Do stuff 2")
    throw MyError.NetworkError
    return "Some return value"
}
*/

/*
enum Animals{
    case Dog, Cat, Troll, Dragon
}
let a = Animals.Dragon
*/

/*
enum SomeException: ErrorType {
    case Oops
}

func bad() throws {
    throw SomeException.Oops
}

func good() {
    do {
        try bad()
    }
    catch SomeException.Oops {
        print("There was an exception")
    }
    catch {
        print("This is required because...")
    }
}
*/
