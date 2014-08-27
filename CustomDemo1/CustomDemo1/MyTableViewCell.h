//
//  MyTableViewCell.h
//  CustomDemo1
//
//  Created by Andrew on 14-8-27.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"

@interface MyTableViewCell : UITableViewCell

@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)CustomView *myView;

@property CGRect cellRect,originRect;

/*!
 *  @brief  填充数值
 *
 *  @param dict 传来的数据字典
 *
 *  @since <#version number#>
 */
-(void)setDataSouce:(NSDictionary*)dict;

@end
