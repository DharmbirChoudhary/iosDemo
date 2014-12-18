//
//  ViewController.m
//  TimeDemo
//
//  Created by Andrew on 14-11-13.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer  *_timer;
}
@property (nonatomic)NSInteger count;
@property (nonatomic,strong)UIButton *reSendBtn ;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _reSendBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 100, 320, 50)];
    [_reSendBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_reSendBtn];
    
    _count=60;
	// Do any additional setup after loading the view, typically from a nib.
    NSTimeInterval timeInterval =1.0 ;
   _timer=[NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(timeGoOn:) userInfo:nil repeats:YES];
    [_timer fire];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

-(void)timeGoOn:(NSTimer*)time{
    NSString *countStr=[NSString stringWithFormat:@"倒计时:%d",--_count];
    [_reSendBtn setTitle:countStr forState:UIControlStateNormal];
    if(_count==0){
        [_reSendBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        _count=60;
        [_timer invalidate];
    }
}

@end
