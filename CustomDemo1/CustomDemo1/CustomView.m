//
//  CustomView.m
//  CustomDemo1
//
//  Created by Andrew on 14-8-27.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius=15;
        self.alpha=0.6;
        self.layer.shadowColor=[UIColor blackColor].CGColor;
        self.layer.shadowOffset=CGSizeMake(4, 4);
        self.backgroundColor=[UIColor grayColor];
        
        self.controlArray=[[NSMutableArray alloc]init];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setData:(NSArray*)array{
    UIView *subview;
    for (subview in self.controlArray) {
        [subview removeFromSuperview];
        subview=nil;
    }
    
    
    CGFloat height=(self.frame.size.height-20)/array.count;
    CGFloat width=self.frame.size.width;
    
    for (int i=0; i<array.count; i++) {
        UIView *view;
        if(i==0){
             view=[[UIView alloc]initWithFrame:CGRectMake(0, 5+height*i,width, height)];
        }else{
             view=[[UIView alloc]initWithFrame:CGRectMake(0, 10+height*i,width, height)];
        }
        view.backgroundColor=[UIColor clearColor];
        [self addSubview:view];
        [self.controlArray addObject:view];
        
        //创建显示标题的label
        UILabel *lb=[[UILabel alloc]initWithFrame:CGRectMake(30, height/2-10, 200, 20)];
        lb.text=array[i];
        lb.textColor=[UIColor blueColor];
        [view addSubview:lb];
        [self.controlArray addObject:lb];
        
        UIView *lineImgView=[[UIView alloc]initWithFrame:CGRectMake(15,height, width-30, 2)];
        lineImgView.backgroundColor=[UIColor blueColor];
        [view addSubview:lineImgView];
        [self.controlArray addObject:lineImgView];
    }
    
}

@end
