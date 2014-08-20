//
//  FkGradientViewController.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FkGradientViewController.h"
#import "FKGradientView.h"

@interface FkGradientViewController (){
    FKGradientView *gradientView;
    UIScrollView *scrollview;
}

@end

@implementation FkGradientViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    [self.view addSubview:scrollview];
    
    gradientView=[[FKGradientView alloc]initWithFrame:scrollview.bounds];
    [scrollview addSubview:gradientView];
    
    [self initView];
}

-(void)initView{

    UILabel *lb1=[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(scrollview.frame), 100, 20)];
    lb1.text=@"渐变类型";
    lb1.textColor=[UIColor blackColor];
    [self.view addSubview:lb1];
    
    UISegmentedControl *segment=[[UISegmentedControl alloc]initWithItems:@[@"线性渐变",@"圆形渐变"]];
    segment.frame=CGRectMake(140, CGRectGetMaxY(scrollview.frame), 170, 20);
    [segment addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventValueChanged];
    [segment setSelectedSegmentIndex:0];
    [self.view addSubview:segment];
    
    
    
    UISwitch *beforeSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(segment.frame.origin.x, CGRectGetMaxY(segment.frame)+20, 100, 20)];
    [beforeSwitch addTarget:self action:@selector(beforeStart:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:beforeSwitch];
    
    UISwitch *afterSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(segment.frame.origin.x, CGRectGetMaxY(beforeSwitch.frame)+20, 100, 20)];
    [afterSwitch addTarget:self action:@selector(afterStart:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:afterSwitch];
    
}
/*!
 *  @brief  改变渐变类型
 *
 *  @param segment UISegmentedControl
 *
 *  @since <#version number#>
 */
-(void)changeType:(UISegmentedControl*)segment{
    gradientView.type=segment.selectedSegmentIndex;
}

-(void)beforeStart:(UISwitch*)sw{
    gradientView.beforeStart=sw.isOn;
}
-(void)afterStart:(UISwitch*)sw{
    gradientView.afterEnd=sw.isOn;
}


@end
