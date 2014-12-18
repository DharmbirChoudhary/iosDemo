//
//  ViewController.m
//  TestFlightDemo1
//
//  Created by Andrew on 14-8-13.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "TestFlight.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)checkItem:(id)sender {
    
//    [TestFlight passCheckpoint:@"添加了检查点"];
//    TFLog(@"远程客户端添加了检查点");
}
- (IBAction)openFeedview:(id)sender {
//    [TestFlight openFeedbackView];
}

@end
