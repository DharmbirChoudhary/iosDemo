//
//  FKAccount.m
//  ThreadDemo
//
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKAccount.h"

@implementation FKAccount
NSCondition *cond;
bool flag;


-(id)init{
    self=[super init];
    if(self){
        cond=[[NSCondition alloc]init];
    }
    return self;
}

-(id)initWithAccountNo:(NSString *)accountNo balance:(float) balacne{
    self=[super init];
    if(self){
        cond=[[NSCondition alloc]init];
        _accountNo=accountNo;
        _balance=balacne;
    }
    return self;
}

/*!
 *  @brief  取钱的操作
 *
 *  @param drawAmount <#drawAmount description#>
 *
 *  @since <#version number#>
 */
-(void)draw:(float) drawAmount{
    //加锁
    [cond lock];
    //如果flag为NO,表明账户中还没有人存钱进去，则取钱方法阻塞
    if(!flag){
        [cond wait];
    }else{
       //执行取钱操作
        
        NSLog(@"%@取钱:%g",[NSThread currentThread].name,drawAmount);
        _balance=_balance-drawAmount;
        //账户余额为
        NSLog(@"账户余额为:%f",self.balance);
        //将表示已有存款的旗标设为NO
        flag=NO;
        //唤醒其它线程
        [cond broadcast];
    }
    
    [cond unlock];
}

/*!
 *  @brief  存钱的操作
 *
 *  @param depositAmount <#depositAmount description#>
 *
 *  @since <#version number#>
 */
-(void)deposit:(float)depositAmount{
    [cond lock];
    //如果flag为YES,则表明账户中已经有人存钱进去，存钱方法阻塞
    if(flag){
        [cond wait];
    }else{
       //执行存款操作
        
        NSLog(@"%@存款:%f",[NSThread currentThread].name,depositAmount);
        _balance+=depositAmount;
        NSLog(@"账户余额为:%g",_balance);
        //将表示账户是否已有存款的旗标设置为YES
        flag=YES;
        //唤醒其它线程
        [cond broadcast];
    }
    [cond unlock];
}



@end
