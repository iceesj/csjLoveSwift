//
//  Subscripts.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-7-10.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

import UIKit
//下标
class Subscripts: CSJSwiftViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "下标"
        subscriptsMethod()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func subscriptsMethod(){
        print("----下标----")
        
        //下标允许我们为class，struct，enum定义下标，以更便捷的方式访问属性。
        //比如，Array和Dictionary都是结构和改写struct中保存的数据。
        //一个类型中可以定义多种下标访问方式（重载）
        
        //下标可以定义“读写”，“只读”型，通过定义一组操作完成的，这与之前的计算属性的setter和getter是一样的
        
        //下标语法，Subscript Syntax
        //读写型
        /*
        subscript(index:Int) -> Int {
            get {
                // return an appropriate subscript value here
            }
            set(newValue) {
                // perform a suitable setting action here
            }
        }
        */
        
        //只读型
        /*
        subscript (index: Int) -> Int{
            //因为只有一个get方法，所以不需要get{}了
        }
        */
        
        //定义了一个叫TimesTable的结构体，他有一个只读性下标的定义
        //通过下标语法subscript 可以得到multiplier那么多倍的index值
        struct TimesTable{
            let multiplier: Int
            subscript (index : Int) -> Int{
                print(multiplier)//3
                print(index)//6
                print(multiplier * index)//18
                return multiplier * index
            }
        }
        let threeTimesTable = TimesTable(multiplier: 3)
        print("six times three is \(threeTimesTable[6])")
        
        //多维数组，二维数组，下标选项（Subscript Options）
        struct Matrix{
            //行，列
            let rows:Int, columns:Int
            var grid:[Double]
            init (rows:Int ,columns:Int){
                self.rows = rows
                self.columns = columns
                grid = Array(repeating: 0.0, count: rows * columns)
            }
            func indexIsValidForRow(_ row:Int, column:Int) -> Bool{
                return row >= 0 && row < rows && column >= 0 && column < columns
            }
            
            subscript (row:Int ,column:Int) -> Double{
                get {
                    assert(indexIsValidForRow(row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set {
                    assert(indexIsValidForRow(row, column: column), "Index out of range")
                    grid[(row * columns)+column] = newValue
                }
            }
            //定义了矩阵类型Matrix ，通过grid来定义一个一维Array来保存数据
            //读写型下标
            //根据row和column可以计算出要访问的元素在Array中的位置，通过Array下标可直接～读取～写入～数据
//            var matrix = Matrix(rows: 2, columns: 2)
//            matrix[0, 1] = 1.5
//            matrix[1, 0] = 3.2
            
        }
        
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
