//
//  ViewController.m
//  CopyDemo
//
//  Created by Andrew on 14-10-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "FKDog.h"

#import "FkItem.h"
#import "FKItemView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    FKDog *dog=[FKDog new];
//    dog.name=[NSMutableString stringWithString:@"旺财"];
//    dog.age=20;
//    
//    FKDog *dog2=[dog copy];
//    dog2.name=[NSMutableString stringWithString:@"小强"];
//    dog2.age=12;
//    
//    NSLog(@"dog1的名字:%@,年龄:%d",dog.name,dog.age);
//    NSLog(@"dog2的名字:%@,年龄:%d",dog2.name,dog2.age);
    
    
    [self KVODemo];
}

-(void)copy1{
    // 创建一个FKDog对象
    FKDog* dog1 = [FKDog new];
    dog1.name = [NSMutableString stringWithString:@"旺财"];
    dog1.age = 20;
    
    // 复制副本
    FKDog* dog2 = [dog1 copy];
    // 修改dog2的name属性值
    [dog2.name replaceCharactersInRange:
     NSMakeRange(0 , 2)    withString:@"snoopy"];
    
    
    // 查看dog2、dog1的name属性值
    NSLog(@"dog2的name为:%@" , dog2.name);
    NSLog(@"dog1的name为:%@" , dog1.name);
}

-(void)KVODemo{
    FkItem *item=[[FkItem alloc]init];
    item.name=@"I love ios";
    item.price=105;
    
    //创建FKItemView对象
    FKItemView *itemview=[[FKItemView alloc]init];
    itemview.item=item;
    [itemview showItemInfo];
    
    //再次修改item对象的属性，将会激发监听器的方法
    item.name=@"疯狂XML讲义";
    item.price=69;
    
    
}

@end
