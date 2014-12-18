//
//  ISCollectionViewCell.m
//  JuNiuProject
//
//  Created by Andrew on 14/12/11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ISCollectionViewCell.h"

@implementation ISCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        _picImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 154, 200)];
        _picImgView.image=[UIImage imageNamed:@"me"];
        [self.contentView addSubview:_picImgView];
        
        _nameLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 130, 200, 20)];
        _nameLb.text=@"test";
        _nameLb.textColor=[UIColor redColor];
        _nameLb.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLb];
        
        self.layer.cornerRadius=9;
        self.layer.masksToBounds=YES;
        
        self.contentView.layer.borderWidth=2;
        self.contentView.layer.borderColor=[UIColor redColor].CGColor;
    }
    return self;
}

@end
