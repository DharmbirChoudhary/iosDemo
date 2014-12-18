//
//  ViewController.m
//  MD5Demo
//
//  Created by Andrew on 14-11-12.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *t=[Test md5:@"123456789"];
    NSLog(@"md5==%@",t);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
