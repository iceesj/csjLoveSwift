//
//  Enumerations.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014年 iceesj. All rights reserved.
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
        println("----枚举----")
        
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
        enum CompassPoint{
            case North,South,East,West
        }
        enum Planet {
            case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
        }
        
        //既然是类型,就用enum定义变量
        //预先指定West
        var directionToHead = CompassPoint.West
        //初始化了CompassPoint后，就不再需要再写枚举的类型了
        directionToHead = .East
        

        //switch中也是类似
        //Switch condition evaluates to a constant
        //原因可能是因为编译器认为我的变量在函数内部一直是不变吧
        switch directionToHead {
            case .North:
                println("Lots of planets have a north")
            case .South:
                println("Watch out for penguins")
            case .East:
                println("Where the sun rises")
            case .West:
                println("Where the skies are blue")
            //prints "Where the sun rises"
        }
        
        let somePlanet : Planet = .Earth
        switch somePlanet{
            case .Earth:
                println("Mostly harmless")
            default:
                println("Not a safe place for humans")
        }
        
        //关联值，Associated Values
        //Barcod不存储任何东西，仅仅定义了类型，需要再定义变量
        enum Barcode{
            case UPCA(Int,Int,Int,Int)
            case QRCode(String)
        }
        var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
        productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
        
//        switch productBarcode{
//            case .UPCA(let numberSystem, let manufacturer, let product, let check):
//            println("UPC-A: \(numberSystem),\(manufacturer),\(product),\(check)")
//            case .QRCode(let productCde):
//            println("QR code:\(productBarcode)")
//        }
        //值是var or let 可以提前
        switch productBarcode {
            case let .UPCA(numberSystem, manufacturer, product, check):
                println("UPC-A: \(numberSystem),\(manufacturer),\(product),\(check)")
            case let .QRCode(productCde):
                println("QR code:\(productBarcode)")
        }
        
        
        //可以为enum定义值，Raw Values
        enum ASCIIControlCharacter :Character{
            case Tab = "\t", LineFeed = "\n", CarriageReturn = "\r"
        }
        enum NewPlanet:Int{
            case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
        }
        //toRaw 取到枚举的值
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        let earthsOrder = NewPlanet.Earth.rawValue
        println("earthsOrder 取值 ＝ \(earthsOrder)")
        //fromRaw 通过值取到NewPlanet成员
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        let possiblePlanet = NewPlanet(rawValue: 7)
        println("possiblePlanet 取枚举 = \(possiblePlanet)")
        
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        var whichPlanet: NewPlanet? = NewPlanet(rawValue: 10000)
        println("whichPlanet = \(whichPlanet)")
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
