//
//  CustomView.h
//  CustomDemo1
//
//  Created by Andrew on 14-8-27.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

-(void)setData:(NSArray*)array;

@property (nonatomic,strong)NSMutableArray *controlArray;

@end
