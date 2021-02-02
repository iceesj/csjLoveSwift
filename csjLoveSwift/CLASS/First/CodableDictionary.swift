//
//  CodableDictionary.swift
//  csjLoveSwift
//
//  Created by iceesj on 2018/1/4.
//  Copyright © 2018年 iceesj. All rights reserved.
//

import Foundation
import UIKit

class CodableDictionary: CSJSwiftViewController {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict1 : [Float : String] = [
            18.0: "ff0000",
            20.0: "00ff00",
            21.0: "0000ff"
        ]
        
        let dict2 : [Int : String] = [
            18: "ff0000",
            20: "00ff00",
            21: "0000ff"
        ]

        if #available(iOS 11.0, *) {
            print("dict = \(dict1)");
            print("dict = \(dict2)");
        }
    }
    
    func nihaoCondable (_ dict : [AnyHashable : Any]) -> String {
        if #available(iOS 11.0, *) {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
//            let encoded = try! encoder.encode(dict)
//            let jsonText = String(decoding: encoded, as: UTF8.self)
//            print(jsonText)
            return "14"
        } else {
            // Fallback on earlier versions
            return "before iOS 11"
        }
    }

    
}
