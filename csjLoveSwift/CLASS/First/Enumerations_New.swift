//
//  Enumerations_New.swift
//  csjLoveSwift
//
//  Created by tom on 16/5/26.
//  Copyright © 2016年 iceesj. All rights reserved.
//

import UIKit

class Enumerations_New: UIViewController {
    
    enum Parterre : String {
        case nickname1 = "Rose"
        case nickname2 = "Carnation"
        case nickname3 = "tulip"
        case nickname4 = "orchid"
        case nickname5 = "peony"
        case nickname6 = "cactus"
        
    }
    
    enum Digital : Int{
        case one = 1
        case two = 2
        case three = 3
        case four  = 4
        case five  = 5
    }
    
    enum Barcode {
        case UPCA(Int, Int, Int)
        case QRCode(String)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flower = Parterre.nickname1
        print("flower = \(flower)")
        
        switch flower {
        case .nickname1:
            print("Rose")
        case .nickname2:
            print("Carnation")
        case .nickname3:
            print("tulip")
        case .nickname4:
            print("orchid")
        case .nickname5:
            print("peony")
        case .nickname6:
            print("cactus")
//            default:
//                print("其他")
        }
        
        
        let onevalue = Digital.one.rawValue
        print("onevalue = \(onevalue)")
        
        let fivevalue = Digital.five.rawValue
        print("fivevalue = \(fivevalue)")
        
        if let onemember = Digital(rawValue : 2){
            let a = onemember
            switch a {
            case .one:
                print("one")
            default:
                print("other digital")
            }
        }
        
        
        let productBarcode = Barcode.UPCA(8, 85909_51226, 3)//相关值
        switch productBarcode {
        case .UPCA(let numberSystem, let identifier, let check):
            print("UPC-A的值有： \(numberSystem),\(identifier),\(check).")
        default:
            print("QR code 的值有:\(productBarcode)")
        }
        
        
        
        
    }


    

}
