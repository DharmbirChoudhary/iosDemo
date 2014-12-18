//
//  ViewController.m
//  Base64Demo
//
//  Created by Andrew on 14-11-13.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "CommonFunc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSString *str = [NSString stringWithFormat:@"YWE="];
//    NSString *str1 = [NSString stringWithFormat:@"aa"];
//    NSLog(@"resultStr========%@",[CommonFunc textFromBase64String:str]);   //使用类名进行调用
    NSLog(@"resultStr=========%@",[CommonFunc base64StringFromText:@"123456789"]);  //使
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
