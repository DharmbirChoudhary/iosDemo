//
//  ViewTag.h
//  KGKit
//
//  Created by chen on 14-5-29.
//  Copyright (c) 2014年 14zynr. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#ifndef KGKit_ViewTag_h
#define KGKit_ViewTag_h

#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])
#define StatusbarSize ((isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
#define SCREENT_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENT_HEIGHT [UIScreen mainScreen].bounds.size.height

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

/* { thread } */
#define __async_opt__  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define __async_main__ dispatch_async(dispatch_get_main_queue()

#define RELOADIMAGE @"reloadImage"

#endif

#import "QHConfiguredObj.h"
