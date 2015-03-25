//
//  Test.m
//  testaddress
//
//  Created by heaven on 15/3/24.
//  Copyright (c) 2015年 heaven. All rights reserved.
//

#import "Test.h"
#import "CallStack.h"
#import <objc/runtime.h>

@implementation Test
-(void)show
{
    int a = 999;
    int b = 998;
    NSString *str = @"aa";
    int *preI = &b + 9;
    int *clazz = &a + 2;
    SEL *sel = &a + 1;
    NSLog(@"%s, a %p", __FUNCTION__, &a);
    NSLog(@"%s, b %p", __FUNCTION__, &b);
    NSLog(@"%s, preI %p", __FUNCTION__, preI);
    
    NSLog(@"%s, clazz %p", __FUNCTION__, clazz);
    NSLog(@"%s, sel %p", __FUNCTION__, sel);
    
    NSLog(@"%d", *preI);
    NSLog(@"%@", *clazz);
    NSString *str2  = NSStringFromSelector(*sel);
    NSLog(@"%@", str2);

    //
    int *preClazz = preI + 3;
    SEL *preSel = preI + 2;
    
    NSLog(@"%s, preClazz %p", __FUNCTION__, preClazz);
    NSLog(@"%s, preSel %p", __FUNCTION__, preSel);
    
    NSLog(@"%@", *preClazz);
    NSString *str3  = NSStringFromSelector(*preSel);
    NSLog(@"%@", str3);
}
-(void)show2
{
    int a = 999;

    NSString *name = [CallStack preSelName];
    NSLog(@"%@", name);
    NSString *clazz = [CallStack preClassName];
    NSLog(@"%@", clazz);
    
    SEL *preSel = &a + 1;
    int i = 0;
    
    SEL *sel = &a + 1;

    NSString *str2  = NSStringFromSelector(*sel);

    NSString *selName = NSStringFromSelector(*preSel);
    while (![name isEqualToString:selName])
    {
        i++;
        preSel = &a + i;
        selName = NSStringFromSelector(*preSel);
        if (selName)
        {
          //  NSLog(@"preSel: %p %@", *preSel, selName);
        }
    }
    
    NSLog(@"%@", selName);
    
    int *preClazz = *(preSel + 1);
    NSLog(@"%@", preClazz);
    
    id objc= (__bridge id)((void *)(preClazz));
    NSLog(@"%@", objc);
    [objc performSelector:@selector(funA) withObject:nil];
}

-(void)funB
{
    int a = 999;
    int *obj = &a + 2;
    SEL *sel = &a + 1;
    
    NSLog(@"%s, a %p", __FUNCTION__, &a);
    NSLog(@"%s, clazz %p", __FUNCTION__, obj);
    NSLog(@"%s, sel %p", __FUNCTION__, sel);
    
    NSLog(@"%@", *obj);
    NSString *str2  = NSStringFromSelector(*sel);
    NSLog(@"%@", str2);
}
@end
