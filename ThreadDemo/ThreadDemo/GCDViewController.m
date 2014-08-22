//
//  GCDViewController.m
//  ThreadDemo
//
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController(){
    dispatch_queue_t serialQuene;
    dispatch_queue_t concureentQuene;
    
    UIImageView *imgView;
}

@end

@implementation GCDViewController
//定义两个队列

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 70, 100, 30)];
    [btn setTitle:@"同步" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(serial:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(10, 70+50, 100, 30)];
    [btn1 setTitle:@"异步" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(concurrent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(10, 70+50+50, 200, 30)];
    [btn2 setTitle:@"异步下载图片" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn2.backgroundColor=[UIColor blueColor];
    [btn2 addTarget:self action:@selector(downloadImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(10, 70+50+50+50, 200, 30)];
    [btn3 setTitle:@"多次执行任务" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn3.backgroundColor=[UIColor blueColor];
    [btn3 addTarget:self action:@selector(applyExecute:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    //创建imageview
    imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn2.frame)+10,100, 100)];
    [self.view addSubview:imgView];
    
    
   //创建串行队列
    serialQuene=dispatch_queue_create("andrewQuene", DISPATCH_QUEUE_SERIAL);
    //创建并发队列
    concureentQuene=dispatch_queue_create("andrewQuene", DISPATCH_QUEUE_CONCURRENT);
    
    
}

/*!
 *  @brief  并发
 *
 *  @param sender <#sender description#>
 *
 *  @since <#version number#>
 */
-(void)serial:(id)sender{
    //依次将两个代码提交给串行队列
    //必须等到第一个代码块完成后，才能执行第二个代码块
  dispatch_async(serialQuene, ^{
      for (int i=0; i<100; i++) {
          NSLog(@"%@=====%d",[NSThread currentThread],i);
      }
  });
    
    
    dispatch_async(serialQuene, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"%@---------%d",[NSThread currentThread],i);
        }
    });
}

/*!
 *  @brief  异步执行
 *
 *  @param sender <#sender description#>
 *
 *  @since <#version number#>
 */
-(void)concurrent:(id)sender{
//依次将两个代码块，合并到并发队列，两个代码块可以并发的执行
    dispatch_async(concureentQuene, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"%@=====%d",[NSThread currentThread],i);
        }
    });
    
    dispatch_async(concureentQuene, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"%@---------%d",[NSThread currentThread],i);
        }
    });
}

/*!
 *  @brief  使用GCD来下载图片
 *
 *  @param sender <#sender description#>
 *
 *  @since <#version number#>
 */
-(void)downloadImage:(id)sender{
   //将代码提交给系统的全局并发队列
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
        NSString *url=@"http://www.crazyit.org/logo.jpg";
        //从网络获取数据
        NSData *data=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
        //将网络数据初始化UIimage对象
        UIImage *image=[[UIImage alloc]initWithData:data];
        if(image!=nil){
           //将代码提交给主线程关联的队列，改代码将有主线程完成
            dispatch_async(dispatch_get_main_queue(), ^{
                imgView.image=image;
            });
        }else{
            NSLog(@"图片下载错误");
        }
        
    });
}

/*!
 *  @brief  多次执行任务的方法
 *
 *  @param sender <#sender description#>
 *
 *  @since <#version number#>
 */
-(void)applyExecute:(id)sender{
dispatch_apply(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t time) {
    NSLog(@"==执行[%lu]次==%@",time,[NSThread currentThread]);
});
}
/*!
 *  @brief  只执行一次的任务
 *
 *  @param sender <#sender description#>
 *
 *  @since <#version number#>
 */
-(void)once:(id)sender{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //FIXME
        
    });
}

@end
