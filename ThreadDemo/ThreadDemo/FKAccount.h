//
//  FKAccount.h
//  ThreadDemo
//
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKAccount : NSObject

//账号
@property (nonatomic,strong)NSString *accountNo;
@property (nonatomic,readonly)double balance;

-(id)initWithAccountNo:(NSString *)accountNo balance:(float) balacne;



-(void)deposit:(float)depositAmount;

-(void)draw:(float) drawAmount;
@end
