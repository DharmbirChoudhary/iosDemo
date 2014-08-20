//
//  FKArcView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKArcView.h"

@implementation FKArcView

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
    for (int i=0; i<10; i++) {
        //开始定义路径
        CGContextBeginPath(ctx);
        //添加一段圆弧，最有一个参数1代表逆时针
        /*void CGContextAddArc (
         CGContextRef c,
         CGFloat x,
         CGFloat y,
         CGFloat radius,
         CGFloat startAngle,
         CGFloat endAngle,
         int clockwise
         );*/
        CGContextAddArc(ctx, i*25+0, i*25+100, (i+1)*8, M_PI*1.5, M_PI, 0);
        //关闭路径
        CGContextClosePath(ctx);
        //设置填充颜色
        CGContextSetRGBFillColor(ctx, 1, 0, 1, (10-i)*0.1);
        //填充当前路径
        CGContextFillPath(ctx);
    }

}

@end
