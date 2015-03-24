//
//  FirstViewController.m
//  testaddress
//
//  Created by heaven on 15/2/26.
//  Copyright (c) 2015年 heaven. All rights reserved.
//

#import "FirstViewController.h"
#import "Test.h"

@interface FirstViewController ()
@property (nonatomic, strong) Test *test;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _test = [[Test alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click1:(id)sender {
   // NSLog(@"%s, %p", __FUNCTION__, [@"1" UTF8String]);
    int i = 99;
    int j = 100;
    NSLog(@"%s, i %p", __FUNCTION__, &i);
    NSLog(@"%s, j %p", __FUNCTION__, &j);
   // [_test show];
    [_test funB];
}
- (IBAction)click2:(id)sender {
    [_test show2];
}
-(void)test
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
    int *preClazz = preI + 2;
    SEL *preSel = preI + 1;
    
    NSLog(@"%s, preClazz %p", __FUNCTION__, preClazz);
    NSLog(@"%s, preSel %p", __FUNCTION__, preSel);

    NSLog(@"%@", *preClazz);
    NSString *str3  = NSStringFromSelector(*preSel);
    NSLog(@"%@", str3);
}

-(void)funA
{
    NSLog(@"%s", __FUNCTION__);
}
@end
