//
//  GlobalConfig.h
//  Controller
//
//  Created by Andrew on 14-9-17.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#ifndef Controller_GlobalConfig_h
#define Controller_GlobalConfig_h


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : 0)
#endif
