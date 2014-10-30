//
//  MagicalRecord+ShorthandSupport.h
//  Magical Record
//
//  Created by Saul Mora on 3/6/12.
//  Copyright (c) 2012 Magical Panda Software LLC. All rights reserved.
//

#import "MagicalRecord.h"
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface MagicalRecord (ShorthandSupport)

#ifdef MR_SHORTHAND
+ (void) swizzleShorthandMethods;
#endif

@end
