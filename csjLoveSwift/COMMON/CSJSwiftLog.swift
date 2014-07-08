//
//  CSJSwiftLog.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-12.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
import Foundation

class CSJSwiftLog: NSObject {
    init(){
        super.init();
    }
    
    class func showAlertView(title:String,message:String){
        var alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("确定")
        alert.show()
    }
    
}
