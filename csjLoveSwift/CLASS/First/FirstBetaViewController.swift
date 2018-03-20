//
//  FirstBetaViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-8.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit


enum VCType : Int{
    case wwdcVC
    case swiftBasis
    case swiftString
    case arrayAndDict
    case controlFlow
    case function
    case closures
    case enumerations
    case classesAndStructures
    case properties
    case methods
    case subscripts
    case inheritance
    case initialization
    case deinitialization
    case swiftARC
    case optionalChaining
    case typeCasting
    case nestedTypes
    case extensions
    case protocols
    case generics
    case advancedOperators
    case functionVCOne
    case closures_New
    case enumerations_New
    case curryingVC
    case codableDictionary
    
    case count

    var viewController: UIViewController {
        switch self {
            case .wwdcVC: return wwdcRoom102(nibName :nil, bundle: nil)
            case .swiftBasis: return SwiftBasis(nibName: nil, bundle: nil)
            case .swiftString: return SwiftString(nibName: nil, bundle: nil)//字符和字符串
            case .arrayAndDict: return ArrayAndDict(nibName: nil, bundle: nil)//集合类型
            case .controlFlow: return ControlFlow(nibName: nil, bundle: nil)//控制流[控制语句]
            case .function: return Function(nibName: nil, bundle: nil)//函数
            case .closures: return Closures(nibName: nil, bundle: nil)//闭包
            case .enumerations: return Enumerations(nibName: nil, bundle: nil)//枚举
            case .classesAndStructures: return ClassesAndStructures(nibName: nil, bundle: nil)//类和结构体
            case .properties: return Properties(nibName: nil, bundle: nil)//属性
            case .methods: return Methods(nibName: nil, bundle: nil)//方法
            case .subscripts: return Subscripts(nibName: nil, bundle: nil)//下标
            case .inheritance: return Inheritance(nibName: nil, bundle: nil)//继承
            case .initialization: return Initialization(nibName: nil, bundle: nil)//构造过程
            case .deinitialization: return Deinitialization(nibName: nil, bundle: nil)//析构过程
            case .swiftARC: return SwiftARC(nibName: nil, bundle: nil)//ARC
            case .optionalChaining: return OptionalChaining(nibName: nil, bundle: nil)//可选链
            case .typeCasting: return TypeCasting(nibName: nil, bundle: nil)//类型转换
            case .nestedTypes: return NestedTypes(nibName: nil, bundle: nil)//嵌套类型
            case .extensions: return Extensions(nibName: nil, bundle: nil)//扩展
            case .protocols: return Protocols(nibName: nil, bundle: nil)//协议
            case .generics: return Generics(nibName: nil, bundle: nil)//泛型
            case .advancedOperators: return AdvancedOperators(nibName: nil, bundle: nil)//高级运算符
            case .functionVCOne: return FunctionVCOne(nibName: nil, bundle: nil)//2.2函数的返回值
            case .closures_New: return Closures_New(nibName: nil, bundle: nil)//2.2闭包
            case .enumerations_New: return Enumerations_New(nibName: nil, bundle: nil)//2.2枚举
            case .curryingVC: return CurryingVC(nibName: nil, bundle: nil)//柯里化
            case .codableDictionary: return CodableDictionary(nibName: nil, bundle: nil)//Codable

            case .count:                      return UIViewController()
            
        }
    }
}

class FirstBetaViewController: UITableViewController {
    
    var baseArray = ["wwdcRoom102","基础","字符和字符串","集合类型","控制流[控制语句]","函数","闭包","枚举","类和结构体","属性","方法","下标","继承","构造过程","析构过程","ARC","可选链","类型转换","嵌套类型","扩展","协议","泛型","高级运算符","2.2函数的返回值","2.2闭包","2.2枚举","柯里化","Codable"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FirstViewController"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source
    
    //xcode beta6
//    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    //xcode beta7
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //xcode beta6
//    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    //xcode beta7
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return baseArray.count
    }
    
    //Xcode6 beta1 and beta2
//    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
    //Xcode6 beta3
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Xcode 6 beta1&2
//        let cell = tableView?.dequeueReusableCellWithIdentifier("firstCell", forIndexPath: indexPath) as UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as UITableViewCell
        //swift 1.1
        cell.textLabel?.text = baseArray[(indexPath as NSIndexPath).row]
        return cell
    }
    
    //点击cell跳转
    //    override func tableView(tableView: (UITableView!), didSelectRowAtIndexPath indexPath: NSIndexPath!){
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        //xcode beta6
//        var data = baseArray[indexPath!.row]
        //xcode6 beta7 所有navigationController 变成 navigationController?
//        let data = baseArray[(indexPath as NSIndexPath).row]
        if let vctype = VCType(rawValue : indexPath.row){
            self.navigationController!.pushViewController(vctype.viewController, animated: true)
        }
        
//        if data == "wwdcRoom102"{
//            self.navigationController!.pushViewController(vctype.view, animated: true)
//        }

        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
