//
//  SliderViewController.m
//  ImFiveDemo
//
//  Created by Andrew on 14/12/4.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "SliderViewController.h"
#import "QHViewTag.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _rightView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREENT_WIDTH , SCREENT_HEIGHT)];
    _rightView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_rightView];
    
    UIPanGestureRecognizer *panGes=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [_rightView addGestureRecognizer:panGes];
    
}

-(void)panAction:(UIPanGestureRecognizer*)ges{
    static CGFloat currentTranslateX;
    if (panGes.state == UIGestureRecognizerStateBegan)
    {
        currentTranslateX = _mainContentView.transform.tx;
    }
}


@end
