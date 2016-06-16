//
//  NestedTypes.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//嵌套类型
class NestedTypes: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "嵌套类型"
        nestedTypesMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nestedTypesMethod(){
        print("----嵌套类型----")
        
        struct BlackjackCard{
            //nested Suit enumeration 嵌套适合的枚举
            enum Suit: Character{//性格品质
                case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
            }
            
            enum Rank: Int {
                case two = 2, three, four, five, six, seven, eight, nine, ten
                case jack, queen, king, ace
                
                struct Values {
                    let first: Int, second: Int?
                }
                var values : Values{
                    switch self{
                    case .ace:
                        return Values(first: 1, second: 11)
                    case .jack, .queen, .king:
                        return Values(first: 10, second: nil)
                    default:
                        //使用toRaw 和fromRaw 两个函数，实现原始值和枚举值之间进行切换
                        //定义原始枚举类型是Int型，只需要给第一个定义枚举赋值，后续会顺序分配；
                        //你也可以使用浮点型和String类型作为枚举的原始类型
                        //swift 1.0 toRaw()
                        //swift 1.1 rawValue
                        return Values(first: self.rawValue, second: nil)
                    }
                }
            }
            
            //BlackjackCard properties and methods
            let rank: Rank , suit: Suit
            //描述
            var description: String {
                //swift 1.0 toRaw()
                //swift 1.1 rawValue
                var output = "suit is \(suit.rawValue),"//传入Spades
                    output += "value is \(rank.values.second)"
                    
                    if let second = rank.values.second{
                        output += " or \(second)"
                    }
                    return output
            }
            
        }
        
        let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
        print("theAceOfSpades: \(theAceOfSpades.description)")
        //theAceOfSpades : suit is ♠,value is lor 11
        
        //swift 1.0 toRaw()
        //swift 1.1 rawValue
        let heartsSymbol = BlackjackCard.Suit.hearts.rawValue//转化成实际值，
        print("heartsSymbol = \(heartsSymbol)")
        
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
