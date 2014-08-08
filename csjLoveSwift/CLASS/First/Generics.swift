//
//  Generics.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import UIKit
//泛型
class Generics: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "泛型"
        genericsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func genericsMethod(){
        println("----泛型----")
        
        //泛型是为了解决在针对不同数据类型，而做了同一种功能操作导致的每个类型都要写一份代码的问题。有了泛型，我们可以只写一份逻辑代码，而适应于不同的数据类型。
        
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
