//
//  CallStack.m
//  testaddress
//
//  Created by heaven on 15/3/24.
//  Copyright (c) 2015年 heaven. All rights reserved.
//

#import "CallStack.h"
#include <execinfo.h>

#define K	(1024)
#define M	(K * 1024)
#define G	(M * 1024)

#undef	MAX_CALLSTACK_DEPTH
#define MAX_CALLSTACK_DEPTH	(64)

@implementation CallStack

+ (NSString *)preSelName
{
    void * stacks[MAX_CALLSTACK_DEPTH] = { 0 };
    backtrace( stacks, (int)(3));
    char ** symbols = backtrace_symbols( stacks, (int)3 );
    
    NSString * symbol = [NSString stringWithUTF8String:(const char *)symbols[2]];
    NSString *ret;
    NSRange range1 = [symbol rangeOfString:@"["];
    NSRange range2 = [symbol rangeOfString:@"]"];
    
    if ( range1.length > 0 && range2.length > 0 )
    {
        NSRange range3;
        range3.location = range1.location + 1;
        range3.length = range2.location + range2.length - range1.location - 2;
        ret = [symbol substringWithRange:range3];
    }
    
    free( symbols );
    
    NSArray *array = [ret componentsSeparatedByString:@" "];
    return array[1];
}

+ (NSString *)preClassName
{
    void * stacks[MAX_CALLSTACK_DEPTH] = { 0 };
    backtrace( stacks, (int)(3));
    char ** symbols = backtrace_symbols( stacks, (int)3 );
    
    NSString * symbol = [NSString stringWithUTF8String:(const char *)symbols[2]];
    NSString *ret;
    NSRange range1 = [symbol rangeOfString:@"["];
    NSRange range2 = [symbol rangeOfString:@"]"];
    
    if ( range1.length > 0 && range2.length > 0 )
    {
        NSRange range3;
        range3.location = range1.location + 1;
        range3.length = range2.location + range2.length - range1.location - 2;
        ret = [symbol substringWithRange:range3];
    }
    
    free( symbols );
    
    NSArray *array = [ret componentsSeparatedByString:@" "];
    return array[0];
}
@end
