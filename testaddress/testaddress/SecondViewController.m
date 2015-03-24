//
//  SecondViewController.m
//  testaddress
//
//  Created by heaven on 15/2/26.
//  Copyright (c) 2015年 heaven. All rights reserved.
//

#import "SecondViewController.h"

static NSString *aaa = @"1";
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click1:(id)sender {
    NSString *str = @"1";
    NSLog(@"%s, a %p", __FUNCTION__, &str);
  //  NSLog(@"%s, b %p", __FUNCTION__, [aaa UTF8String]);
}

@end
