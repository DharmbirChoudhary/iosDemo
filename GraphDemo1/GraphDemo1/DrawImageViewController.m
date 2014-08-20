//
//  DrawImageViewController.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "DrawImageViewController.h"
#define SPACE 64

@interface DrawImageViewController ()

@end

@implementation DrawImageViewController

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
    
    UIImageView *imgview=[[UIImageView alloc]initWithImage:[self drawImage:self.view.bounds.size]];
    [self.view addSubview:imgview];
}

-(UIImage *)drawImage:(CGSize)size{
    //创建内存中的图片
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2);
    //下面开始向内存中绘制图形
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);//设置线条颜色
    //绘制一个矩形
    CGContextStrokeRect(ctx, CGRectMake(180, 30+SPACE, 120, 60));
    //填充一个矩形
    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextFillRect(ctx, CGRectMake(30, 30+SPACE, 180, 60));
    
    
    CGContextSetRGBStrokeColor(ctx, 0, 1, 1, 1);
    //绘制一个椭圆
    CGContextStrokeEllipseInRect(ctx, CGRectMake(30, 120+SPACE, 120, 60));
    CGContextSetRGBStrokeColor(ctx, 1, 0, 1, 1);
    
    //填充一个椭圆
    CGContextFillEllipseInRect(ctx, CGRectMake(180, 120+SPACE, 129, 60));
    
    
    
    
    //获取该绘图Context中得图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //结束绘图
    UIGraphicsEndImageContext();
    //获取当前应用路径documents目录下的指定文件名对应的文件路径
    NSString *path=[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"newPng.png"];
    
    NSLog(@"path:%@",path);
    //保存png图片
    [UIImagePNGRepresentation(newImage) writeToFile:path atomically:YES];
    return newImage;
    
}

@end
