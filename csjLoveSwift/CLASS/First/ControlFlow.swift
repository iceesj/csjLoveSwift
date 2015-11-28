//
//  ControlFlow.swift
//  csjLoveSwift
//
//  Created by 曹 盛杰 on 14-7-7.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//控制语句
class ControlFlow: CSJSwiftViewController {

    //Xcode6 beta5
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "控制语句"
        
        control()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func control(){
        //for
        for var index=0;index<3;++index{
            print("index is \(index)")
        }
        //or
        var index :Int
        for index = 0; index<3;++index{
            print("index is \(index)")
        }
        
        //条件语句if else
        let individualScores = [75,43,103,87,12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            }else{
                teamScore += 1
            }
        }
        print("score \(teamScore)")
        
        //while
        var count = 0
        var whileIndex = 10
        
        while whileIndex > 0 {
            count += whileIndex
//            print("count \(count)")//10+9+8+7+6+5+4+3+2+1=55
//            print("whileIndex \(whileIndex)")
            --whileIndex
        }
        print("count = \(count)")
        //or
        
        //Swift 1.2
//        do {
        //Swift 2
        repeat {
            count+=whileIndex
            --whileIndex
        }while whileIndex > 0
        print("do count = \(count)")
        
        //switch
        let someCharacter:Character = "e"
        switch someCharacter{
            case "a","e","i","o","u":
                print("\(someCharacter) is a vowel")
        case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
            print("\(someCharacter) is a consonant")
        default:
            print("\(someCharacter) is not a vowel or a consonant")
        }
        
        
        let countSwitch = 15
        switch countSwitch{
            case 0...1:
                print("countSwitch count is 0.5")
            break
            case 1...10:
                print("countSwitch count is 1...10")
            break
            case 11...20:
                print("countSwitch count is 11...20")//get
            break
            default:
                print("什么都不是")
            break
        }
        
        //元组switch
//        let myPoint = (1,3)
//        switch myPoint {
//        case (0,0):print("myPoint is (0,0)")
//        case (_,0):print("myPoint 第二个元素为0 (_,0)")
//        case (1,_):print("myPoint 第一个元素为1 (1,_)")//get
//        case (1,3):print("是的")
//        default:print("myPoint 什么都不是")
//        }
        
        //switch let
        let myNewPoint = (2,0)
        switch myNewPoint {
        case (let x , 0): print("myNewPoint is \(x),0")//get
//        case (0, let y): print("myNewPoint is 0,\(y)")
//        case let(x,y): print("myNewPoint is \(x),\(y)");
        }
        
        //switch where
        let myWherePoint = (1,-1)
            switch myWherePoint {
//                case let (x,y) where x == y: print(" x==y")
                case let (x,y) where x == -y: print(" x== -y")
//                case let (x,y):print("x,y")
        }
        
        //fallthrough
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is "
        switch integerToDescribe{
        case 2,5: description += "a prime number ,and also"
            fallthrough
        default :description += " an integer."
        }
        print(description)
        
        
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
