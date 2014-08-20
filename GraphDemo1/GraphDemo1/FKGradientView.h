//
//  FKGradientView.h
//  GraphDemo1
//  渐变色的模型
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    KlinearGradient=0,
    kRadialGradient
}GradientType;

@interface FKGradientView : UIView

@property (nonatomic)GradientType type;
@property (nonatomic)BOOL beforeStart;
@property (nonatomic)BOOL afterEnd;

@end
