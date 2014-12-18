//
//  FKApple.m
//  StringDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKApple.h"

@implementation FKApple
-(id)initWIthcolor:(NSString *)color weight:(double)weight size:(int)size{
    if(self=[super init]){
        self.color=color;
        self.weight=weight;
        self.size=size;
    }
    return self;
}
/*!
 *  @brief  重写父类的描述方法
 *
 *  @return 描述字符串
 *
 *  @since
 */
-(NSString*)description{
    return [NSString stringWithFormat:@"<FKApple[color=%@,weight=%g,size=%d]>",self.color,self.weight,self.size];
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
   //调用NScoder的方法归档对象的每个实例变量
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeDouble:_weight forKey:@"weight"];
    [aCoder encodeInt:_size forKey:@"size"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    _color=[aDecoder decodeObjectForKey:@"color"];
    _weight=[aDecoder decodeDoubleForKey:@"weight"];
    _size=[aDecoder decodeIntForKey:@"size"];
    
    return self;
}
@end
