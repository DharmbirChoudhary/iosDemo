//
//  ViewController.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "View1.h"
#import "FKViewController.h"
#import "DrawImageViewController.h"
#import "DrawFontViewController.h"
#import "DrawARCViewController.h"
#import "DrawLineViewController.h"
#import "TransformViewController.h"
#import "FkGradientViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController (){
    FKViewController *fk;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"demo" style:UIBarButtonItemStyleBordered target:self action:@selector(goNextView:)];
    self.navigationItem.rightBarButtonItem=item;
    
//    [self drawGraph1];
    
    
    
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH-20, 30)];
    [btn1 setTitle:@"创建图片" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn1.backgroundColor=[UIColor blueColor];
    [btn1 addTarget:self action:@selector(handerToCreatePic:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(10, 100+50, SCREEN_WIDTH-20, 30)];
    [btn2 setTitle:@"绘制文字" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn2.backgroundColor=[UIColor blueColor];
    [btn2 addTarget:self action:@selector(handerToDrawWord:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(10, 100+50+50, SCREEN_WIDTH-20, 30)];
    [btn3 setTitle:@"绘制路径" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn3.backgroundColor=[UIColor blueColor];
    [btn3 addTarget:self action:@selector(handerToDrawArc:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4=[[UIButton alloc]initWithFrame:CGRectMake(10, 100+50+50+50, SCREEN_WIDTH-20, 30)];
    [btn4 setTitle:@"绘制直线" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn4.backgroundColor=[UIColor blueColor];
    [btn4 addTarget:self action:@selector(handerToDrawLine:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5=[[UIButton alloc]initWithFrame:CGRectMake(10, 100+50+50+50+50, SCREEN_WIDTH-20, 30)];
    [btn5 setTitle:@"坐标变换" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn5.backgroundColor=[UIColor blueColor];
    [btn5 addTarget:self action:@selector(handerToTransform:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    UIButton *btn6=[[UIButton alloc]initWithFrame:CGRectMake(10, 100+50+50+50+50+50, SCREEN_WIDTH-20, 30)];
    [btn6 setTitle:@"渐变颜色" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn6.backgroundColor=[UIColor blueColor];
    [btn6 addTarget:self action:@selector(handerToGradient:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];
    
    
}

-(void)goNextView:(id)sender{
     fk=[[FKViewController alloc]init];
    [self.navigationController pushViewController:fk animated:YES];
}

-(void)handerToCreatePic:(id)sender{
    DrawImageViewController *drawVC=[[DrawImageViewController alloc]init];
    [self.navigationController pushViewController:drawVC animated:YES];
}

-(void)handerToDrawWord:(UIButton*)btn{
    DrawFontViewController *fontVC=[[DrawFontViewController alloc]init];
    [self.navigationController pushViewController:fontVC animated:YES];
}

-(void)handerToDrawArc:(UIButton*)btn{
 
    DrawARCViewController *arcView=[[DrawARCViewController alloc]init];
    [self.navigationController pushViewController:arcView animated:YES];
}

-(void)handerToDrawLine:(UIButton *)btn{
    DrawLineViewController *lineVC=[[DrawLineViewController alloc]init];
    [self.navigationController pushViewController:lineVC animated:YES];
}
-(void)handerToTransform:(UIButton*)btn{
    TransformViewController *transformVC=[[TransformViewController alloc]init];
    [self.navigationController pushViewController:transformVC animated:YES];
}

-(void)handerToGradient:(UIButton*)btn{
    FkGradientViewController *gradientVC=[[FkGradientViewController alloc]init];
    [self.navigationController pushViewController:gradientVC animated:YES];
}
-(void)drawGraph1{
    View1 *view=[[View1 alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
}



@end
