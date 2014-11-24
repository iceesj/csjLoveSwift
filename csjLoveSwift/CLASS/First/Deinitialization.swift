//
//  Deinitialization.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//析构过程
class Deinitialization: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "析构过程"
        deinitializationMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deinitializationMethod() {
        println("----析构过程----")
        
        //析构过程是构造过程的逆向过程，当一个类的实例被释放的时候，在内存中消失前，析构器会被调用
        //swift通过ARC管理内存。
        
        
        //由于swift是ARC管理内存，所以析构过程已经不是那么重要了
        class MyClass{
            var myNum = 0
            init (){
                myNum = 1
            }
            
            deinit {
                myNum = 0
                println("myNum \(myNum)")
            }
        }
        
        var myClass = MyClass()
        println("myClass.myNum = \(myClass.myNum)")
//        myClass = nil
        
        //Deinitializers in Action
        struct Bank {
            //在银行的金币数
            static var coinsInBank = 10_000
            //出售金币
            static func vendCoins(var numberOfCoinsToVend:Int)->Int{
                println("numberOfCoinsToVend = \(numberOfCoinsToVend)")
                println("coinsInBank = \(coinsInBank)")
                numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
                println("numberOfCoinsToVend = \(numberOfCoinsToVend)")
                coinsInBank -= numberOfCoinsToVend
                return numberOfCoinsToVend
            }
            
            //收到金币
            static func receiveCoins(coins:Int){
                coinsInBank += coins
            }
        }
        
        class Player{
            //硬币钱包
            var coinsInPurse : Int
            //初始化
            init (coins: Int){
                coinsInPurse = Bank.vendCoins(coins)
                println("Player.init.coinsInPurse = \(coinsInPurse)")
            }
            //赢得的钱币
            func winCoins(coins:Int){
                coinsInPurse += Bank.vendCoins(coins)
            }
            //析构过程
            deinit{
                Bank.receiveCoins(coinsInPurse)
            }
        }
        
        //生成一个player，初始化银行出售金币100枚
        var playerOne : Player? = Player(coins:100)
        println("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        // prints "A new player has joined the game with 100 coins"
        println("There are now \(Bank.coinsInBank) coins left in the bank")
        // 银行剩余9900 coins
        
        playerOne!.winCoins(2_000)
        println("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        //赢了2000枚，加上前面的100枚
        println("The bank now only has \(Bank.coinsInBank) coins left")//银行剩余7900
        playerOne = nil
        println("The bank now only has \(Bank.coinsInBank) coins left")//银行剩余10000枚
        
        
    }
    
    //
    deinit{
        //清理工作在这里进行
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
