//
//  FKPatternViewController.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-21.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKPatternViewController.h"
#import "FKPatternView.h"

@interface FKPatternViewController ()

@end

@implementation FKPatternViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializations
        self.view.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FKPatternView *view=[[FKPatternView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    [view setNeedsDisplay];
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
