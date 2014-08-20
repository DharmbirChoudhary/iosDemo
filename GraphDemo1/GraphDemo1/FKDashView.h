//
//  FKDashView.h
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKDashView : UIView{
    CGFloat dashPattern[10];
    size_t dashCount;
}

@property (nonatomic,assign)CGFloat dashPhase;

-(void)setDashPattern:(CGFloat*)pattern count:(size_t)count;


@end
