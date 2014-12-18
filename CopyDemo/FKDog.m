//
//  FKDog.m
//  CopyDemo
//
//  Created by Andrew on 14-10-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKDog.h"

@implementation FKDog


-(id)copyWithZone:(NSZone *)zone{
    NSLog(@"执行了copyWithZone");
    FKDog *dog=[[[self class] allocWithZone:zone] init];
    dog.name=self.name;
    dog.age=self.age;
    
    return dog;
}

@end
