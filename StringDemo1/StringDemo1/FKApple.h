//
//  FKApple.h
//  StringDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKApple : NSObject<NSCoding>

@property (nonatomic,copy) NSString *color;

@property (nonatomic)double weight;

@property (nonatomic)int size;

-(id)initWIthcolor:(NSString *)color weight:(double)weight size:(int)size;

@end
