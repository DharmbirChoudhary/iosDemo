//
//  FKDashView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKDashView.h"

@implementation FKDashView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.opaque=YES;
        self.backgroundColor=[UIColor blackColor];
        //设置每次清空上一次绘制的内容
        self.clearsContextBeforeDrawing=YES;
        dashCount=0;
        self.dashPhase=0;
    }
    return self;
}

-(void)setDashPhase:(CGFloat)dashPhase{
    if(_dashPhase!=dashPhase){
        _dashPhase=dashPhase;
        [self setNeedsDisplay];
    }
}

-(void)setDashPattern:(CGFloat *)pattern count:(size_t)count{
    if(count!=dashCount || (memcmp(dashPattern, pattern, sizeof(CGFloat)*count!=0))){
        memcpy(dashPattern, pattern, sizeof(CGFloat)*count);
        dashCount=count;//对dashCount赋值
        [self setNeedsDisplay];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1, 0, 1, 1);
    CGContextSetLineWidth(ctx, 2.0);
    //设置点线模式
    CGContextSetLineDash(ctx, self.dashPhase, dashPattern, dashCount);
    CGPoint line[]={CGPointMake(10, 20),CGPointMake(310, 20)};
    CGContextStrokeLineSegments(ctx, line, 2);
    
    CGPoint line1[]={CGPointMake(160, 130),CGPointMake(160, 30)};
    CGContextStrokeLineSegments(ctx, line1, 2);
    
    //绘制一个矩形
    CGContextStrokeRect(ctx, CGRectMake(10, 30, 100, 100));
    CGContextStrokeEllipseInRect(ctx, CGRectMake(210, 30, 100, 100));
}


@end
