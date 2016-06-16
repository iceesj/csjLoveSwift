//
//  Enumerations.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//枚举
class Enumerations: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "枚举"
        enumMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enumMethod(){
        print("----枚举----")
        
        //首字母大写
        enum SomeEnumeration{
            
        }
        /*
        enum CompassPoint{
            case North
            case South
            case East
            case West
        }
        */
        //or
        enum CompassPoint : String{
            case North,South,East,West
        }
        enum Planet {
            case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        
        //Swift 2.2
        /*
        //既然是类型,就用enum定义变量
        //预先指定West
        var directionToHead = CompassPoint.West
        //初始化了CompassPoint后，就不再需要再写枚举的类型了
        directionToHead = .East
//        let directionToHead = CompassPoint.West
        //switch中也是类似
        //Switch condition evaluates to a constant
        //原因可能是因为编译器认为我的变量在函数内部一直是不变吧
        switch directionToHead {
            case .North:
                print("Lots of planets have a north")
            case .South:
                print("Watch out for penguins")
            case .East:
                print("Where the sun rises")
            case .West:
                print("Where the skies are blue")
            //prints "Where the sun rises"
        }
        */
        
        //Swift 2.2
        /*
        let somePlanet : Planet = .Earth
        switch somePlanet{
            case .Earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
        }
        */
        
        //关联值，Associated Values
        //Barcod不存储任何东西，仅仅定义了类型，需要再定义变量
        enum Barcode{
            case upca(Int,Int,Int,Int)
            case qrCode(String)
        }
        
        //Swift 2.2
        /*
        var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
        productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
        
//        switch productBarcode{
//            case .UPCA(let numberSystem, let manufacturer, let product, let check):
//            print("UPC-A: \(numberSystem),\(manufacturer),\(product),\(check)")
//            case .QRCode(let productCde):
//            print("QR code:\(productBarcode)")
//        }
        //值是var or let 可以提前
        switch productBarcode {
            case let .UPCA(numberSystem, manufacturer, product, check):
                print("UPC-A: \(numberSystem),\(manufacturer),\(product),\(check)")
            //Swift 2.2
            case .QRCode(_):
            //Swift 2.1
//            case let .QRCode(productCde):
                print("QR code:\(productBarcode)")
        }
        */
        
        //可以为enum定义值，Raw Values
        enum ASCIIControlCharacter :Character{
            case tab = "\t", lineFeed = "\n", carriageReturn = "\r"
        }
        enum NewPlanet:Int{
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        //toRaw 取到枚举的值
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        let earthsOrder = NewPlanet.earth.rawValue
        print("earthsOrder 取值 ＝ \(earthsOrder)")
        //fromRaw 通过值取到NewPlanet成员
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        let possiblePlanet = NewPlanet(rawValue: 7)
        print("possiblePlanet 取枚举 = \(possiblePlanet)")
        
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        let whichPlanet: NewPlanet? = NewPlanet(rawValue: 10000)
        print("whichPlanet = \(whichPlanet)")
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
