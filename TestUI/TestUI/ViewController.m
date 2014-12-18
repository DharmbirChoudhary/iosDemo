//
//  ViewController.m
//  TestUI
//
//  Created by Andrew on 14-9-17.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.btn.frame=CGRectMake(100, 300, 200, 50) ;
    self.btn.backgroundColor=[UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
