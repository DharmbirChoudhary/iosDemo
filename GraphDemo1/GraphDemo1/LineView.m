//
//  LineView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1, 0.3, 0.5, 1);
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, 2);
    //开始绘制线段
    CGContextMoveToPoint(ctx, 10, 100);
    CGContextAddLineToPoint(ctx, 300, 100);
    CGContextStrokePath(ctx);
    //保存一次状态
    CGContextSaveGState(ctx);
    
    
    CGContextSetLineWidth(ctx, 20);
    //恢复状态
     CGContextRestoreGState(ctx);
    //绘制边线的矩形
    CGContextStrokeRect(ctx, CGRectMake(10, 110, 200, 50));
    //绘制填充的矩形
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(10, 200, 200, 40));
    
    CGContextStrokeEllipseInRect(ctx, CGRectMake(10, 240, 100, 40));
    CGContextAddRect(ctx, CGRectMake(140, 240, 100, 40));
    
   
    
    CGContextAddRect(ctx, CGRectMake(10, 300, 100, 40));
    CGContextSetShadow(ctx, CGSizeMake(5, 5), 0.1);
    CGContextFillPath(ctx);
    
    //去掉阴影
    CGContextSetShadow(ctx,CGSizeZero, 0);
//    CGContextSetBlendMode(ctx,kCGBlendModeScreen);
    CGContextSetRGBFillColor(ctx, 1, 0.4, 0.5, 0.2);
    CGContextFillRect(ctx, CGRectMake(30, 250, 70, 100));
    

    CGContextStrokePath(ctx);
    CGContextClosePath(ctx);
}


@end
