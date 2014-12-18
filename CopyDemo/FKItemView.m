//
//  FKItemView.m
//  CopyDemo
//
//  Created by Andrew on 14-10-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//


#import "FKItemView.h"

@implementation FKItemView

@synthesize item=_item;

-(void)showItemInfo{
    NSLog(@"item物品名为:%@;item的价格为:%f",_item.name,_item.price);
}

//自定义setItem方法
-(void)setItem:(FkItem *)item{
    self->_item=item;
    //为item添加监听
    [self.item addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    //为item的price添加监听
    [self.item addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew context:nil];
    
    
}


//重写该方法，当被监听的数据模型发生改变时，就会回调监听器的该方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"--ObserveValueForkeyPath方法被调用");
    NSLog(@"被修改的keypath为:%@",keyPath);
    NSLog(@"被修改的对象为:%@",object);
    NSLog(@"新被修改的属性值为:%@",[change objectForKey:@"new"]);
    NSLog(@"被修改的上下文:%@",context);
    
}


-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"name"];
    [self.item removeObserver:self forKeyPath:@"price"];
}









@end
