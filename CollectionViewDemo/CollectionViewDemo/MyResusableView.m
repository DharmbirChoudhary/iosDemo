//
//  MyResusableView.m
//  CollectionViewDemo
//
//  Created by Andrew on 14-11-10.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "MyResusableView.h"

@implementation MyResusableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _nameLb=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 20)];
        [self addSubview:_nameLb];
        UIImage *img=[UIImage imageNamed:@"HomeBanner"];
        _picImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, img.size.height)];
//        _picImgView.image=img;
        [self addSubview:_picImgView];
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

@end
