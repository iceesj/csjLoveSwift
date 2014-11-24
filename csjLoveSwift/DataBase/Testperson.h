//
//  Testperson.h
//  csjLoveSwift
//
//  Created by iceesj on 14-8-26.
//  Copyright (c) 2014  iceesj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Testperson : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * testpersonID;

@end
