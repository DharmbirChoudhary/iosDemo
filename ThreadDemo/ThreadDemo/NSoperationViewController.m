//
//  NSoperationViewController.m
//  ThreadDemo
//
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "NSoperationViewController.h"

NSOperationQueue *queue;
UIImageView *imgview;

@implementation NSoperationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    queue=[[NSOperationQueue alloc]init];
    
    imgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 80, 200, 200)];
    [self.view addSubview:imgview];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(imgview.frame)+20, 100, 40)];
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

-(void)clicked:(id)sender{
 
    NSString *url=@"http://carzyit.org/logo.jpg";
    //以传入的代码块作为执行体
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
       //从网络获取数据
        NSData *data=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *image=[[UIImage alloc]initWithData:data];
        if(image!=nil){
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
        }else{
            NSLog(@"下载图片错误");
        }
    }];
    //将NSOperation添加给NSOperationQuere
    [queue addOperation:operation];
}

-(void)updateUI:(UIImage *)img{
  
}


@end
