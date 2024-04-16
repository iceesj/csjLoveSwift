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
        case get
        case put
        case post
        case delete
        
        func description()->NSString {
            switch self{
            case .get:
                return "GET"
            case .put:
                return "PUT"
            case .post:
                return "POST"
            case .delete:
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
    
    // 异步
    class func sendRequest(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            completionHandler(data, response, error)
        }
        task.resume()
    }
    
    // 同步
    class func sendSynchronousRequest(request: URLRequest) -> (Data?, URLResponse?, Error?) {
        let semaphore = DispatchSemaphore(value: 0)
        var responseData: Data?
        var response: URLResponse?
        var responseError: Error?

        let task = URLSession.shared.dataTask(with: request) { data, resp, error in
            responseData = data
            response = resp
            responseError = error
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()

        return (responseData, response, responseError)
    }
    
    //同步NSURLConnection
    class func requestSynchronousWithURL(_ urlString:String,completionHandler:(_ data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        let URL = Foundation.URL(string: urlString)
        var req = URLRequest(url: URL!)
        var httpResponse: URLResponse? = nil
        req.httpMethod = "GET"
//    class func sendSynchronousRequest(request: NSURLRequest!, returningResponse response: AutoreleasingUnsafePointer<NSURLResponse?>, error: NSErrorPointer) -> NSData!
        let (data, response, error) = sendSynchronousRequest(request: req)
        if let error = error {
            print("Error: \(error)")
        } else if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode), let data = data {
            do {
                if let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary {
                    // 现在 jsonData 是 NSDictionary 类型，你可以安全地使用它
                    print("Received JSON data: \(jsonData)")
                    completionHandler(jsonData)
                } else {
                    // 如果数据不是字典，将执行这里的代码
                    print("The JSON is not a dictionary")
                }
            } catch {
                // 如果解析出错，将执行这里的代码
                print("Failed to parse JSON: \(error)")
            }
            print("Received data: \(String(data: data, encoding: .utf8) ?? "No data")")
        } else {
            print("Server error or no data")
        }
//        do {
//            let responseData = try NSURLConnection.sendSynchronousRequest(req, returning: &httpResponse)
//            if responseData != nil{
//                do {
//                    let jsonData : NSDictionary = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
//                    completionHandler(jsonData)
//                } catch {
//                    print("同步请求回的Data出错")
//                }
//            }else{
//                
//            }
//        } catch {
//            print("同步请求出错")
//        }
        
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
    class func requestWithURL(_ urlString:String,completionHandler:@escaping (_ data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        let URL = Foundation.URL(string: urlString)
        let req = URLRequest(url: URL!)
        let queue = OperationQueue();
//        + (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))handler
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: {
            response, data, error in
            //xcode6 beta6 change
//            if error {
            if (error != nil) {
                DispatchQueue.main.async(execute: {
                    print(error)
                    completionHandler(NSNull())
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
                    let jsonData : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(jsonData)
                    })
                } catch {
                    print("An error occurred. = requestWithURL")
                }
            }
        })
    }
    
    //异步NSURLSession
    class func requestWithURLbyiOS7Later(_ urlString:String, completionHandler:@escaping (_ data:AnyObject)->Void){
        //swift 1.1
//        var URL = NSURL.URLWithString(urlString)
        let URL = Foundation.URL(string: urlString)
        let req = URLRequest(url: URL!)
//        let dict : NSDictionary?
//        var session = NSURLSession.sharedSession()
//        func dataTaskWithRequest(request: NSURLRequest!, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask!
        //Swift3beta1
//        URLSession.shared().dataTask(with: req) { (dataA, response, error) -> Void in
        //Swift3beta2
        URLSession.shared.dataTask(with: req) { (dataA, response, error) -> Void in
            print("异步")
            if error != nil {
                DispatchQueue.main.async(execute: { () -> Void in
                    print(error)
                    completionHandler(NSNull())
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
                    let jsonData : NSDictionary = try JSONSerialization.jsonObject(with: dataA!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionHandler(jsonData)
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
    class func parseJSON(_ inputData : Data) -> NSDictionary{
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
            dictJson = try JSONSerialization.jsonObject(with: inputData, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
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
