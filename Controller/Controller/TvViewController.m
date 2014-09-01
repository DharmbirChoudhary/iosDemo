//
//  FirstViewController.m
//  Controller
//
//  Created by lws on 14-8-24.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#import "TvViewController.h"
#include "NetWorkDelegate.h"

@interface TvViewController ()

@end

@implementation TvViewController
- (IBAction)triggSignal:(UIButton *)sender {
        
        NSString *message = [[NSString alloc] initWithFormat:@"%ld", (long)sender.tag];
        NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
        [[NetWorkDelegate sharedInstance] sendRawData:data callBack:nil];
}

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

@end
