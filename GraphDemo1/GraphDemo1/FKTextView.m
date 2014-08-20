//
//  FKTextView.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKTextView.h"

@implementation FKTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
    //设置字符间距
    CGContextSetCharacterSpacing(ctx, 4);
    //设置填充颜色
    CGContextSetRGBFillColor(ctx, 1, 0, 1, 1);
    //设置线条颜色
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    //设置使用填充模式绘制文字
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
   
    //绘制文字
    NSString *text=@"雄才大略";
    
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:58],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    [text drawAtPoint:CGPointMake(10, 80) withAttributes:dict];
    
    //使用描边模式绘制文字
     CGContextSetTextDrawingMode(ctx, kCGTextStroke);
    text=@"汉武大帝";
      NSDictionary *dict1=@{NSFontAttributeName:[UIFont systemFontOfSize:58],NSForegroundColorAttributeName:[UIColor blueColor]};
    [text drawAtPoint:CGPointMake(10,150) withAttributes:dict1];
    
    //设置填充
    CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
    text=@"独尊儒术";
    NSDictionary *dict2=@{NSFontAttributeName:[UIFont systemFontOfSize:58],NSForegroundColorAttributeName:[UIColor orangeColor]};
    [text drawAtPoint:CGPointMake(10,150+80) withAttributes:dict2];
    
    //定义一个变换矩阵
    CGAffineTransform yRevert=CGAffineTransformMake(1, 0, 0, -1, 0, 0);
    //设置绘制文字的字体和大小
    CGAffineTransform scale=CGAffineTransformRotate(yRevert,2);
    
    CGAffineTransform rotate=CGAffineTransformRotate(scale, M_PI*2.3/180);
    
    CGContextSetTextMatrix(ctx, rotate);
 
    CGContextSetShadow(ctx, CGSizeMake(8, -6), 5);
    CGContextSetShadowWithColor(ctx, CGSizeMake(10, 8), 10, [[UIColor redColor] CGColor]);
    
    text=@"明明就";
    [text drawAtPoint:CGPointMake(10,150+80+80) withAttributes:dict2];
    
}


@end
