//
//  SecondViewController.m
//  Controller
//
//  Created by lws on 14-8-24.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#import "LightViewController.h"
#import "NetWorkDelegate.h"

@interface LightViewController ()

@end

@implementation LightViewController

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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [AppDelegate globalDelegate].pType=PTYPE_LIGHT;
    
}

@end
