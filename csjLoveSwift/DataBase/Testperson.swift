//
//  Testperson.swift
//  csjLoveSwift
//
//  Created by iceesj on 14-8-25.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

import Foundation
import CoreData

class Testperson: NSManagedObject {

    @NSManaged var testpersonID: String
    @NSManaged var firstName: String
    @NSManaged var lastName: String

}
