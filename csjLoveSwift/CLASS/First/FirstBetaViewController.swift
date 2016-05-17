//
//  FirstBetaViewController.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-8.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit

class FirstBetaViewController: UITableViewController {
    var baseArray = ["wwdcRoom102","基础","字符和字符串","集合类型","控制流[控制语句]","函数","闭包","枚举","类和结构体","属性","方法","下标","继承","构造过程","析构过程","ARC","可选链","类型转换","嵌套类型","扩展","协议","泛型","高级运算符","函数的返回值","新闭包"]
    
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
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //xcode beta6
//    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    //xcode beta7
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return baseArray.count
    }
    
    //Xcode6 beta1 and beta2
//    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
    //Xcode6 beta3
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Xcode 6 beta1&2
//        let cell = tableView?.dequeueReusableCellWithIdentifier("firstCell", forIndexPath: indexPath) as UITableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("firstCell", forIndexPath: indexPath) as UITableViewCell
        //swift 1.1
        cell.textLabel?.text = baseArray[indexPath.row]
        return cell
    }
    
    //点击cell跳转
    //    override func tableView(tableView: (UITableView!), didSelectRowAtIndexPath indexPath: NSIndexPath!){
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //xcode beta6
//        var data = baseArray[indexPath!.row]
        //xcode6 beta7 所有navigationController 变成 navigationController?
        let data = baseArray[indexPath.row]
        if data == "wwdcRoom102"{
            let wwdcVC = wwdcRoom102(nibName :nil, bundle: nil)
//            self.navigationController.pushViewController(wwdcVC, animated:true)
            self.navigationController!.pushViewController(wwdcVC, animated: true)
        }
        else if data == "基础" {
            let basisVC = SwiftBasis(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(basisVC, animated: true)
        }
        else if (data == "字符和字符串"){
            let StringVC = SwiftString(nibName: nil,bundle: nil)
            self.navigationController!.pushViewController(StringVC, animated:true)
        }
        else if (data == "集合类型"){
            let commentsVC = ArrayAndDict(nibName :nil, bundle: nil)
            self.navigationController!.pushViewController(commentsVC, animated:true)
        }
        else if (data == "控制流[控制语句]"){
            let controlflow = ControlFlow(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(controlflow, animated:true)
        }
        else if (data == "函数"){
            let functionVC = Function(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(functionVC, animated:true)
        }
        else if (data == "闭包"){
            let bibaoVC = Closures(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(bibaoVC, animated:true)
        }
        else if (data == "枚举"){
            let enumVC = Enumerations(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(enumVC, animated: true)
        }
        else if (data == "类和结构体"){
            let classAndStructuresVC = ClassesAndStructures(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(classAndStructuresVC, animated:true
            )
        }
        else if (data == "属性"){
            let propertyVC = Properties(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(propertyVC, animated:true)
        }
        else if (data == "方法"){
            let methodVC = Methods(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(methodVC, animated:true)
        }
        else if (data == "下标"){
            let subscriptsVC = Subscripts(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(subscriptsVC, animated:true)
        }
        else if (data == "继承"){
            let inherVC = Inheritance(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(inherVC, animated:true)
        }
        else if (data == "构造过程"){
            let initVC = Initialization(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(initVC, animated:true)
        }
        else if (data == "析构过程"){
            let deinitVC = Deinitialization(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(deinitVC, animated:true)
        }
        else if (data == "ARC"){
            let arcVC = SwiftARC(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(arcVC, animated:true)
        }
        else if (data == "可选链"){
            let optionalChainingVC = OptionalChaining(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(optionalChainingVC, animated:true)
        }
        else if (data == "类型转换"){
            let typeCastingVC = TypeCasting(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(typeCastingVC, animated:true)
        }
        else if (data == "嵌套类型"){
            let nestedTypesVC = NestedTypes(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(nestedTypesVC, animated:true)
        }
        else if (data == "扩展"){
            let extensionsVC = Extensions(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(extensionsVC, animated:true)
        }
        else if (data == "协议"){
            let protocolsVC = Protocols(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(protocolsVC, animated:true)
        }
        else if (data == "泛型"){
            let genericsVC = Generics(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(genericsVC, animated:true)
        }
        else if (data == "高级运算符"){
            let advancedVC = AdvancedOperators(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(advancedVC, animated:true)
        }
        else if (data == "函数的返回值"){
            let hanshufanhuiVC = FunctionVCOne(nibName: nil, bundle: nil)
            self.navigationController!.pushViewController(hanshufanhuiVC , animated:true)
        }else if (data == "新闭包") {
            let closuresNew = Closures_New(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(closuresNew, animated: true)
        }
        
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
