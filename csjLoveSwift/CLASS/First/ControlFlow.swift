//
//  ControlFlow.swift
//  csjLoveSwift
//
//  Created by 曹 盛杰 on 14-7-7.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
//控制语句
class ControlFlow: CSJSwiftViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        control()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func control(){
        //for
        for var index=0;index<3;++index{
            println("index is \(index)")
        }
        //or
        var index :Int
        for index = 0; index<3;++index{
            println("index is \(index)")
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
        println("score \(teamScore)")
        
        //while
        var count = 0
        var whileIndex = 10
        
        while whileIndex > 0 {
            count += whileIndex
//            println("count \(count)")//10+9+8+7+6+5+4+3+2+1=55
//            println("whileIndex \(whileIndex)")
            --whileIndex
        }
        println("count = \(count)")
        //or
        do {
            count+=whileIndex
            --whileIndex
        }while whileIndex > 0
        println("do count = \(count)")
        
        //switch
        let someCharacter:Character = "e"
        switch someCharacter{
            case "a","e","i","o","u":
                println("\(someCharacter) is a vowel")
        case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
            println("\(someCharacter) is a consonant")
        default:
            println("\(someCharacter) is not a vowel or a consonant")
        }
        
        let countSwitch = 15
        switch countSwitch{
            case 0:println("countSwitch count is 0")
            case 1...10:println("countSwitch count is 1...10")
            case 11...20:println("countSwitch count is 11...20")//get
            default:println("什么都不是")
        }
        
        //元组switch
        let myPoint = (1,3)
        switch myPoint {
        case (0,0):println("myPoint is (0,0)")
        case (_,0):println("myPoint 第二个元素为0 (_,0)")
        case (1,_):println("myPoint 第一个元素为1 (1,_)")//get
        default:println("myPoint 什么都不是")
        }
        
        //switch let
        let myNewPoint = (2,0)
        switch myNewPoint {
        case (let x , 0): println("myNewPoint is x,0")//get
        case (0, let y): println("myNewPoint is 0,y")
        case let(x,y): println("myNewPoint is x,y");
        }
        
        //switch where
        let myWherePoint = (1,-1)
        switch myWherePoint {
        case let (x,y) where x == y: println(" x==y")
        case let (x,y) where x == -y: println(" x== -y")
        case let (x,y):println("x,y")
        }
        
        //fallthrough
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is "
        switch integerToDescribe{
        case 2,5: description += "a prime number ,and also"
            fallthrough
        default :description += " an integer."
        }
        println(description)
        
        
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
