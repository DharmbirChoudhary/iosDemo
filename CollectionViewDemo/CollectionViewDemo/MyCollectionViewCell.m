//
//  MyCollectionViewCell.m
//  CollectionViewDemo
//
//  Created by Andrew on 14-10-24.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _nameLb=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 40, 20)];
        [self addSubview:_nameLb];
      
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
