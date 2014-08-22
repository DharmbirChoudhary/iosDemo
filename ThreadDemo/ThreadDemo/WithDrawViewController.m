//
//  WithDrawViewController.m
//  ThreadDemo
//  取钱存钱
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "WithDrawViewController.h"
#import "FKAccount.h"

@implementation WithDrawViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //创建一个账号
    account=[[FKAccount alloc]initWithAccountNo:@"123234" balance:1000.0];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"执行操作" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(depositDraw:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)depositDraw:(id)sender{
   //创建，启动3个存钱者的线程
    [NSThread detachNewThreadSelector:@selector(drawMethod:) toTarget:self withObject:[NSNumber numberWithDouble:800]];
     [NSThread detachNewThreadSelector:@selector(drawMethod:) toTarget:self withObject:[NSNumber numberWithDouble:800]];
     [NSThread detachNewThreadSelector:@selector(drawMethod:) toTarget:self withObject:[NSNumber numberWithDouble:800]];
    //创建启动存钱者的线程
    [NSThread detachNewThreadSelector:@selector(depositMethod:) toTarget:self withObject:[NSNumber numberWithDouble:800]];
    
}

/*!
 *  @brief  取钱的方法
 *
 *  @param drawAmount 取得金钱数目
 *
 *  @since <#version number#>
 */
-(void)drawMethod:(NSNumber *)drawAmount{
[NSThread currentThread].name=@"甲";
    //重复100次执行取钱的操作
    for (int i=0; i<100; i++) {
        [account draw:drawAmount.doubleValue];
    }
}

/*!
 *  @brief  存钱的操作
 *
 *  @param depositAmount <#depositAmount description#>
 *
 *  @since <#version number#>
 */
-(void)depositMethod:(NSNumber *)depositAmount{
    [NSThread currentThread].name=@"乙";
    //重复100次存钱的操作
    for (int i=0; i<100; i++) {
        [account deposit:depositAmount.doubleValue];
    }
}

@end
