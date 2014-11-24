//
//  Protocols.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//协议
class Protocols: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "协议"
        protocolsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func protocolsMethod(){
        println("----协议----")
        
        //协议仅是用来定义某些任务或者功能必须的方法和属性。但协议并不会实现具体的功能。
        //语法
        /*
        protocol SomeProtocol {
        //protocol definition goes here
        }
        struct SomeStructure: FirstProtocol, AnotherProtocol {
        // structure definition goes here
        }
        class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
        // class definition goes here
        }
        */
        
        let john = Person(fullName: "John Appleseed")
        println("john = \(john)")
        
        //Starship
        var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
        println("ncc1701 = \(ncc1701)")
        
        //方法要求
        let generator = LinearCongruentialGenerator()
        println("Here's a random number = \(generator.random())")
        println("And another one = \(generator.random())")
        
        //突变方法，OnOffSwitch
        var lightSwitch = OnOffSwitch.Off
        lightSwitch.toggle()
        println("lightSwitch = \(lightSwitch)")//is now equal to .On
        
        
        //协议类型
        var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1...5{
            println("Random dics roll is \(d6.roll())")
        }
        
        
        //代理
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.play()
        
        
        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        println(d12.asText())
        
        //extension SnakesAndLadders: TextRepresentable
        println(game.asText())
        
        //extension Hamster: TextRepresentable {}
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentable: TextRepresentable = simonTheHamster
        println(somethingTextRepresentable.asText())
        
        
        //协议类型的集合，Collections of Protocol Types
        let things: [TextRepresentable] = [game, d12, simonTheHamster]
        println("things = \(things)")
        for thing in things{
            println("thing.asText() = \(thing.asText())")
        }
        
        //extension SnakesAndLadders: PrettyTextRepresentable
        println(game.asPrettyText())
        
        //协议组合
        let birthdayPerson = NewPerson(name: "Malcolm", age: 21)
        wishHappyBirthday(birthdayPerson)
        
        //协议的一致性检查
        let objects: [AnyObject] = [
            //园 半径
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        for object in objects{
            if let objectWithArea = object as? HasArea{
                println("Area is \(objectWithArea.area)")
            }else{
                println("Something that doesn't have an area")
            }
        }
        
        
        //可选协议，Optional Protocol Requirements
        var counter = Counter()
        counter.dataSource = ThreeSource()
        for _ in 1...4{
            counter.increment()//增量
            println(counter.count)
        }
        counter.count = -4
        counter.dataSource = TowardsZeroSource()
        for _ in 1...5{
            counter.increment()//增量
            println(counter.count)
        }
        
    }

}

protocol SomeProtocol{
    var mustBesettable: Int {get set}//通过编写可设置和读取属性
    var doesNotNeedToBeSettable: Int {get}//get表示只读属性
}

protocol AnotherProtocol {
    //即使type property要求与static关键字前缀时实现struct或者enum
    class var somTypeProperty: Int {get set} //类属性
}

//这个FullyNamed协议定义了完全限定的名字。它没有指定什么样的事情必须做。
protocol FullyNamed{
    var fullName : String {get} //这是一个简单只读的 实例属性
}

//它唯一指定必须能够提供一个完整的本身明名称。
//它指定这一个要求，指出任何FullyNamed类型必须有一个可以获得的实例属性fullName
struct Person: FullyNamed{
    var fullName: String
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init (name: String, prefix: String? = nil){
        self.name   = name
        self.prefix = prefix
    }
    var fullName: String {
        //如果不为空，则prefix+空格+name，否则发挥nil
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

//方法要求
protocol SomeNewProtocol{
    class func someTypeMethod() //类方法
}

protocol RandomNumberGenerator{
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom  = 42.0
    let m = 13968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

//突变方法，结构体or枚举，Mutating Method Requirements
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case Off,On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}

//协议类型，Protocols as Types
//现在除了基本类型，enum，struct，class，我们又多了一种类型，协议。
//协议可以作为函数的参数，返回值，常量，变量等
class Dice{
    let sides: Int
    let generator: RandomNumberGenerator
    
    init (sides: Int, generator: RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    //掷骰子方法
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}

//代理，Delegation
//DiceGame协议是可以通过任何涉及骰子的游戏的一个协议
protocol DiceGame{
    var dice: Dice{get}
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        //构造一个”计数“元素的数组
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    func play() {
        //平方
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            //掷骰子
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
             println("Started a new game of Snakes and Ladders")
        }
        println("The game is using a \(game.dice.sides)")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        println("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        println("The game lasted for \(numberOfTurns) turns")
    }
}

//添加协议的一致性扩展，Adding Protocol Conformance with an Extension
//文本表示字符
protocol TextRepresentable {
    func asText() -> String
}
//从早些时候的 Dice类 可以扩展采纳并符合 TextRepresentable
extension Dice: TextRepresentable {
    func asText() -> String{
        return "A \(sides) -side dice"
    }
}

extension SnakesAndLadders: TextRepresentable{
    func asText() -> String{
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

//如果一个类型已经符合协议的所有的需求,但尚未表示采用协议,您可以采用协议与空扩展
struct Hamster{
    var name: String
    func asText() -> String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}


/**
协议继承，Protocol Inheritance
*/
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    //这里定义协议
}
protocol PrettyTextRepresentable: TextRepresentable {
    func asPrettyText() -> String
}
//SnakesAndLadders类可以扩展采纳并符合PrettyTextRepresentable:
extension SnakesAndLadders: PrettyTextRepresentable {
    func asPrettyText() -> String{
        var output = asText() + ":\n"
        
        for index in 1...finalSquare{
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
               
            }
        }
        return output
    }
}

//协议组合，Protocol Composition
protocol Named {
    var name: String {get}
}
protocol Aged {
    var age: Int {get}
}
struct NewPerson: Named, Aged{
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator : protocol<Named,Aged>){
    println("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

//协议的一致性检查，Checking for Protocol Conformance
@objc protocol HasArea{ //objc 说明这个协议是可选的
    var area: Double {get}
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius}
    init (radius: Double){
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init (area: Double){ self.area = area }
}
class Animal {
    var legs: Int
    init (legs: Int) { self.legs = legs}
}


//可选协议，Optional Protocol Requirements
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int {get}
}
@objc class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement? {
            count += amount
        }
    }
}
class ThreeSource: CounterDataSource {
    let fixedIncrement = 3
}
class TowardsZeroSource: CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0{
            return 0
        }else if count < 0 {
            return 1
        }else {
            return -1
        }
    }
}