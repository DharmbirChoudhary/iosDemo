//
//  FKBlendView.h
//  GraphDemo1
//
//  Created by Andrew on 14-8-20.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKBlendView : UIView

@property (nonatomic,strong)UIColor *sourceColor;
@property (nonatomic,strong)UIColor *destinationColor;
@property (nonatomic)CGBlendMode blendModel;
@end
