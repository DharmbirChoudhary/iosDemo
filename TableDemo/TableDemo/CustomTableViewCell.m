//
//  CustomTableViewCell.m
//  TableDemo
//
//  Created by Andrew on 14-11-10.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGFloat width=(320-30)/3;
        _picImgView1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, width, 80)];
        _picImgView1.image=[UIImage imageNamed:@"img_06"];
        [self addSubview:_picImgView1];
        _picImgView1.backgroundColor=[UIColor groupTableViewBackgroundColor];
        
        _nameLb1=[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_picImgView1.frame), 50, 20)];
        _nameLb1.font=[UIFont systemFontOfSize:12];
        _nameLb1.text=@"苹果";
        [self addSubview:_nameLb1];
        
        _priceLb1=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_nameLb1.frame), _nameLb1.frame.origin.y,_picImgView1.frame.size.width-_nameLb1.frame.size.width , 20)];
        _priceLb1.text=[NSString stringWithFormat:@"￥20.00"];
        _priceLb1.font=[UIFont systemFontOfSize:12];
        [self addSubview:_priceLb1];
        //===================================================
        
        _picImgView2=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_picImgView1.frame)+5, 0, width, 80)];
        _picImgView2.image=[UIImage imageNamed:@"img_06"];
        [self addSubview:_picImgView2];
        _picImgView2.backgroundColor=[UIColor groupTableViewBackgroundColor];

        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
