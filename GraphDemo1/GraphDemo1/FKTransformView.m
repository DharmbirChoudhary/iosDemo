//
//  FKTransformView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKTransformView.h"

@implementation FKTransformView

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
    // Drawing code
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 0.3);
    CGContextTranslateCTM(ctx, -80, 200+66);
    
    for (int i=0; i<50; i++) {
        CGContextTranslateCTM(ctx, 50, 50);
        CGContextScaleCTM(ctx, 0.93, 0.93);
        CGContextRotateCTM(ctx, -M_PI/10);
        CGContextFillRect(ctx, CGRectMake(0, 0, 150, 175));
    }
    
//    CGAffineTransformMake(<#CGFloat a#>, <#CGFloat b#>, <#CGFloat c#>, <#CGFloat d#>, <#CGFloat tx#>, <#CGFloat ty#>);
//    CGAffineTransformMakeScale(<#CGFloat sx#>, <#CGFloat sy#>)
    
}


@end
