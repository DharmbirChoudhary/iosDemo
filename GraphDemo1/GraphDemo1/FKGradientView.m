//
//  FKGradientView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKGradientView.h"

@interface FKGradientView()
{
    //定义渐变色的对象
    CGGradientRef gradient;
}

@end


@implementation FKGradientView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque=YES;
        self.backgroundColor=[UIColor whiteColor];
        //设置清空上一次绘制的内容
        self.clearsContextBeforeDrawing=YES;
        //创建RGB的颜色空间
        CGColorSpaceRef rgb=CGColorSpaceCreateDeviceRGB();
        //定义渐变颜色，红绿蓝
        CGFloat colors[]={
        1,0,0,1,
//        0,1,0,1,
//        0,0,1,1,
        };
        //创建渐变对象
        gradient=CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0]*4)));
        
        CGColorSpaceRelease(rgb);
    }
    return self;
}

/*!
 *  @brief  当重新设置渐变类型时，通知该控件重绘自己
 *
 *  @param type <#type description#>
 *
 *  @since <#version number#>
 */
-(void)setType:(GradientType)type{
    if(_type!=type){
        _type=type;
        [self setNeedsDisplay];
    }
}
/*!
 *  @brief  当重新设置是否扩展填充开始点之前的区域时，通知该控件重绘自己
 *
 *  @param beforeStart <#beforeStart description#>
 *
 *  @since <#version number#>
 */
-(void)setBeforeStart:(BOOL)beforeStart{
    if(_beforeStart!=beforeStart){
        _beforeStart=beforeStart;
        [self setNeedsDisplay];
    }
}

-(void)setAfterEnd:(BOOL)afterEnd
{
    if(_afterEnd!=afterEnd){
        _afterEnd=afterEnd;
        [self setNeedsDisplay];
    }
}

-(CGGradientDrawingOptions)drawingOptions{
    CGGradientDrawingOptions options=0;
    if(self.beforeStart){
        options|=kCGGradientDrawsBeforeStartLocation;
    }
    if(self.afterEnd){
        options|=kCGGradientDrawsAfterEndLocation;
    }
    return options;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //获取该组件四周各减少20Px的区域
    
    CGRect clip=CGRectInset(CGContextGetClipBoundingBox(ctx),20, 5);
    NSLog(@"clip:%@",NSStringFromCGRect(clip));
    //定义开始绘制的开始点和结束点
    CGPoint start,end;
    CGFloat startRadius,endRadius;
    CGContextClipToRect(ctx, clip);
    
    switch (self.type) {
        case KlinearGradient://如果用户选择了线性渐变
            start=CGPointMake(clip.origin.x, clip.origin.y+20);
            end=CGPointMake(clip.origin.x, clip.origin.y+clip.size.height*2.75);
            //填充线性渐变
            CGContextDrawLinearGradient(ctx, gradient, start, end, [self drawingOptions]);
            break;
            
        case kRadialGradient:
            //定义圆形渐变的开始圆心，结束圆心都是clip的中心
            start=end=CGPointMake(CGRectGetMidX(clip), CGRectGetMidY(clip));
            
            CGFloat r=clip.size.width<clip.size.height?clip.size.width:clip.size.height;
            startRadius=r*0.125;
            endRadius=r*0.5;
            //填充圆形渐变
            CGContextDrawRadialGradient(ctx, gradient, start, startRadius, end, endRadius, [self drawingOptions]);
            break;
        default:
            break;
    }
    
    //绘制矩形的边框
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    CGContextStrokeRectWithWidth(ctx, clip, 2.0);
    
    CGContextSetRGBFillColor(ctx, 0.2, 0, 0, 0.2);
    CGContextFillRect(ctx, CGRectMake(0, 20, 50, 250));
    CGContextClipToRect(ctx, CGRectMake(0, 20, 50, 250));
    
 
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 20), CGPointMake(0, 840+50),10);//kCGGradientDrawsBeforeStartLocation  kCGGradientDrawsAfterEndLocation
    
}


@end
