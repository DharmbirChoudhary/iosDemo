//
//  DvdViewController.m
//  Controller
//
//  Created by lws on 14-8-24.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#import "DvdViewController.h"
#import "NetWorkDelegate.h"

@interface DvdViewController ()

@end

@implementation DvdViewController

- (IBAction)triggSignal:(UIButton *)sender {
        NSString *message = [[NSString alloc] initWithFormat:@"%ld", (long)sender.tag];
        NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
        [[NetWorkDelegate sharedInstance] sendRawData:data callBack:nil];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _HUDManager=[[MBProgressHUDManager alloc]initWithView:self.view];

    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [AppDelegate globalDelegate].pType=PTYPE_DVD;
    //如果是DVD模式
    if([AppDelegate globalDelegate].isDVDModel){
        [self.HUDManager showMessage:@"DVD Model"];
    }else{
        [self.HUDManager hide];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
