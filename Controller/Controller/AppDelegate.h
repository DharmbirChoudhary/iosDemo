//
//  AppDelegate.h
//  Controller
//
//  Created by lws on 14-8-24.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUDManager.h"

typedef NS_ENUM(NSInteger, PAGETYPE) {
    PTYPE_TV,         // slow at beginning and end
    PTYPE_LIGHT,            // slow at beginning
    PTYPE_DVD,           // slow at end
    PTYPE_CURTAIN,
    PTYPE_FEATURED
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>



@property (strong, nonatomic) UIWindow *window;
@property BOOL isLearningModel;
@property BOOL isDVDModel;

/*!
 *  @brief  页面类型
 */
@property (nonatomic)PAGETYPE pType;


+(AppDelegate *)globalDelegate;

@end
