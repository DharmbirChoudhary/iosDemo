//
//  TransformViewController.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "TransformViewController.h"
#import "FKTransformView.h"

@interface TransformViewController ()

@end

@implementation TransformViewController

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
    // Do any additional setup after loading the view.
    FKTransformView *transformView=[[FKTransformView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:transformView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
