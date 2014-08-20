//
//  View1.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "View1.h"

@implementation View1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
   //获取绘图的上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();

    //设置线宽
    CGContextSetLineWidth(ctx, 16);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    //下面绘制三个线段测试端点形状------
    //定义四个点，绘制线段
    const CGPoint points[]={CGPointMake(10, 20),
                            CGPointMake(100, 20),
                            CGPointMake(100, 20),CGPointMake(20, 50)};
    CGContextStrokeLineSegments(ctx, points, 4);
    
    //设置线段的端点坐标
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    
    const CGPoint points2[]={CGPointMake(110, 20),CGPointMake(200, 20),CGPointMake(200, 20),CGPointMake(120, 50)};
    CGContextStrokeLineSegments(ctx, points2, 4);
 
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    
    CGContextSetLineWidth(ctx, 10);
    CGFloat patterns2[]={6,10};
    CGContextSetLineDash(ctx, 0, patterns2 , 1);
    
    //绘制线段
    CGContextSetLineWidth(ctx, 20);
    const  CGPoint points5[]={CGPointMake(40, 85),CGPointMake(280, 85)};
    CGContextStrokeLineSegments(ctx, points5, 2);
    CGFloat patterners2[]={0,1};
    CGContextSetLineDash(ctx, 10, patterners2, 2);
    
    
    
}


@end
