//
//  CSJSwiftLog.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-6-12.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
import Foundation

class CSJSwiftLog: NSObject {
    override init(){
        super.init();
    }
    
    class func showAlertView(_ title:String,message:String){
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButton(withTitle: "确定")
        alert.show()
    }
    
}
