//
//  FKBlendView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKBlendView.h"

@implementation FKBlendView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _sourceColor=[UIColor whiteColor];
        _destinationColor=[UIColor blackColor];
        _blendModel=kCGBlendModeNormal;
        
    }
    return self;
}

/*!
 *  @brief   当重新设置叠加的源颜色时，通知该控件重绘自己
 *
 *  @param sourceColor 源头颜色
 *
 *  @since <#version number#>
 */
-(void)setSourceColor:(UIColor *)sourceColor{
    if(_sourceColor!=sourceColor){
        _sourceColor=sourceColor;
        [self setNeedsDisplay];
    }
}
/*!
 *  @brief  当重新设置叠加颜色，通知该控件重绘自己
 *
 *  @param destinationColor 目标颜色
 *
 *  @since <#version number#>
 */
-(void)setDestinationColor:(UIColor *)destinationColor{
    if(_destinationColor!=destinationColor){
        _destinationColor=destinationColor;
        [self setNeedsDisplay];
    }
}
/*!
 *  @brief  当重新设置叠加模式时，通知该控件重绘自己
 *
 *  @param blendModel 叠加模式
 *
 *  @since <#version number#>
 */
-(void)setBlendModel:(CGBlendMode)blendModel{
    if(_blendModel!=blendModel){
        _blendModel=blendModel;
        [self setNeedsDisplay];
    }
}

/*!
 *  @brief  重写该方法，重绘控件
 *
 *  @param rect <#rect description#>
 *
 *  @since <#version number#>
 */
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //设置填充颜色
    CGContextSetGrayFillColor(ctx, 0.2, 1.0);
    //填充该控件的背景
    CGContextFillRect(ctx, self.bounds);
    //使用KCGBlendModelCopy混合模式，表示直接将该颜色绘制在背景上，不使用任何的混合模式
    CGContextSetBlendMode(ctx, kCGBlendModeCopy);
    
    //用叠加的目标颜色绘制矩形区域
    CGContextSetFillColorWithColor(ctx, self.destinationColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(110, 120, 100, 100));
    //设置用户选择的叠加模式
    CGContextSetBlendMode(ctx, self.blendModel);
    //用叠加的源头颜色绘制矩形区域
    CGContextSetFillColorWithColor(ctx, self.sourceColor.CGColor);
    CGContextFillRect(ctx, CGRectMake(60, 45, 200, 50));
}


@end
