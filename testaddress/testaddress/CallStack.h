//
//  CallStack.h
//  testaddress
//
//  Created by heaven on 15/3/24.
//  Copyright (c) 2015年 heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CallStack : NSObject
+ (NSArray *)callstack:(NSUInteger)depth;

+ (NSString *)preSelName;
+ (NSString *)preClassName;

@end
