//
//  TypeCasting.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//类型转换
class TypeCasting: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "类型转换"
        typeCastingMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func typeCastingMethod(){
        print("----类型转换----")
        
        //swift 提供了 is 和 as 两个操作符，用以检测值的类型或者转换它的类型
        class MyBasic{
            var name : String
            init (name : String){
                self.name = name
            }
        }
        
        class MyFriend : MyBasic {
            var level = 9
        }
        
        class MySelf : MyBasic {
            var height = 9
        }
        
        var myArray = [MyFriend(name: "Hello"),MySelf(name: "Kitty")];
        
        for elem in myArray{
            if elem is MyFriend{//判断elem是否是MyFriend类型
                let obj = elem as! MyFriend //将obj视为elem向下转型为MyFriend
                print("name: \(obj.name) level: \(obj.level)")
                continue
            }
            
            if elem is MySelf{
                let obj = elem as! MySelf
                print("name \(obj.name) level:\(obj.height)")
                continue
            }
        }
        //判断了类型之后转型，放在一条语句执行
        let obj = myArray[0] as? MySelf
        print("obj = \(obj)")
        
        
        //Any和AnyObject
        //AnyObject可以代表任何类的实例
        //Any可以代表任何类型，除了函数
        //OC中会返回一个AnyObject类型的数组，因为OC中没有明确类型的数组
        
        //AnyObject
        var myNewArray: [AnyObject] = [MyFriend(name: "Hello"),MySelf(name: "Kitty")];
        
        //将数组myNewArray看作是MyFriend类型的数组
        //xcode6 beta7 error
//        for elem in myNewArray as [MyFriend] {
//            print("name \(elem.name) level:\(elem.level)")
//        }
        
        
        //Any
        /*
        var things＝[Any]()
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                print("a movie called '\(movie.name)', dir. \(movie.director)")
            default:
                print("something else")
            }
        }
        // zero as an Int
        // zero as a Double
        // an integer value of 42
        // a positive double value of 3.14159
        // a string value of "hello"
        // an (x, y) point at 3.0, 5.0
        // a movie called 'Ghostbusters', dir. Ivan Reitman
        */
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
