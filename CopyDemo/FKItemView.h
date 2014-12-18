//
//  FKItemView.h
//  CopyDemo
//
//  Created by Andrew on 14-10-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FkItem.h"
@interface FKItemView : NSObject

@property (nonatomic,strong)FkItem *item;


-(void)showItemInfo;

@end
