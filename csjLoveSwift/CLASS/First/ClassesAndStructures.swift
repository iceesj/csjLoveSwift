//
//  ClassesAndStructures.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//类和结构体
class ClassesAndStructures: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "类和结构体"
        cAndsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cAndsMethod() {
        print("----类和结构体----")
        //不会像c++那样用struct取代class关键字
        //swift可以把class和结构体定义在一个.swift里，然后在其他文件里直接用就可以了
        //不需要include，也不需要import
        
        //1允许一个类继承另一个类的特点
        //2允许在运行类实例时，检查和解释类型
        //3使一个类的实例能够释放任何资源分配
        //4引用计数允许多个引用一个类实例
        
        //定义语法，definition syntax
        //类和结构体定义首字母大写
        class SomeClass{
            var typeName = "class"
        }
        struct SomeStructure {
            var typeName = "struct"
        }
//        var myFirstClass = SomeClass(typeName:"")//类不行
        let myFirstClass = SomeClass()//定义一个变量，它是SomeClass类型的实例
        print(myFirstClass.typeName)//访问这个实例的成员属性
        //结构体有特别之处，在初始化的时候，可以把成员的值直接写在参数里面
        let myFirstStr = SomeStructure(typeName:"my first struct")
        print("myFirstStr = \(myFirstStr)")
        
        struct Resolution{
            var width = 0
            var height = 0
        }
        class VideoMode {
            var resolution = Resolution()//定义变量resolution，他是Resolution类型的实例
            var interlaced = false
            var frameRate = 0.0
            var name : String = ""
            
        }
        
        //类和结构实例，Class and Structure Instances
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        //访问属性，Accessing Properties
        print("The width of someResolution is \(someResolution.width)")
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        //点语法
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        
        //为结构类型初始值设定项，Memberwise Initializers for Structure Types
        let vga = Resolution(width: 650, height: 480)
        print("vga = \(vga)")
        
        //结构和枚举值类型，Structures and Enumerations Are Value Types
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        cinema.width = 2048
        print("cinema.width now = \(cinema.width)")
        //However, the width property of the original hd instance still has the old value of 1920:
        print("hd.width now = \(hd.width)")
        
        //同样的行为也适用于枚举，The same behavior applies to enumerations:
        enum CompassPoint{
            case north,south,east,west
        }
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection = .east
        if rememberedDirection == .west {
            print("The remembered direction is still .West")
        }
        
        //类是引用类型，Classes Are Reference Types
        //这个例子声明一个新的常数称为tenEighty并集参考VideoMode类的一个新实例
        //视频模式分配一份高清分辨为1920到1080之前，它是交错的，名称是“1080i”，最后它被设置成25.0帧每秒的帧速率
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("now frameRate = \(alsoTenEighty.frameRate)")
        
        //标识操作符，Identity Operators
        //用来判断两个变量或常量，是否同时引用同一个类的实例，相同的 === 不相同的 !==
        if tenEighty === alsoTenEighty{
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
        }
        
        //Array和Dictionar都是Struct
        var myDictionary = [1:"1",2:"2",3:"3"]
        var myDictionaryCopy = myDictionary;
        
        myDictionary[1] = "8"
        print(myDictionaryCopy[1])// ＝ 1
        
        var myArray = [1,2,3]
        let myArrayCopy = myArray
        print("myArrayCopy = \(myArrayCopy)")
        myArray[1] = 8
        print(myArray[1]) //得到结果是8
        
        //xcode6 beta4 删除
//        print(myArray === myArrayCopy)//false
        
        //swift对Array做了优化，只有在必要时，才会分配一份拷贝
        //Array只有在数组长度变化的时候才拷贝
        //1 unshare() arr变 newArr不变 Xcode6 beta1,2
        /*
        var arr = [0,0,0]
        var newArr = arr
        arr.unshare()
        arr[0] = 1
        arr       //[1, 0, 0]  
        newArr    //[0, 0, 0]
        */
        //2 copy() 直接拷贝 arr变，newArr不变 Xcode6 beta1,2
        /*
        var arr = [0,0,0]
        var copiedArr = arr.copy()
        arr[0] = 1
        arr       //[1, 0, 0]
        copiedArr //[0, 0, 0]
        */
        
        //值类型特点
        var arr = [0,0,0]
//        arr[0]=1//arr = [1,0,0], newArr =[1,0,0]
        let newArr = arr//Xcode6 beta3 newArr = [0,0,0], beta1,2 newArr = [1,0,0]
        arr[0]=1//arr = [1,0,0], newArr =[0,0,0]
        print(arr)
        print(newArr)
        
        
        
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
