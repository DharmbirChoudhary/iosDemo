//
//  FKDog.h
//  CopyDemo
//
//  Created by Andrew on 14-10-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKDog : NSObject<NSCopying>

@property (nonatomic,strong) NSMutableString *name;
@property (nonatomic) int age;

@end
