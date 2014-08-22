//
//  ThreadViewController.m
//  ThreadDemo
//
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ThreadViewController.h"
#import "GlobalConfig.h"



@interface ThreadViewController ()

@property (nonatomic,strong)UIImageView *imgView;

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    CGFloat widht=[UIScreen mainScreen].bounds.size.height;
    
    widht=[UIScreen mainScreen].bounds.size.width;
    
    _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 200, 100)];
    _imgView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_imgView];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_imgView.frame)+20, SCREEN_WIDTH-20, 30)];
    [btn setTitle:@"下载图片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(showImage:) forControlEvents:UIControlEventTouchUpInside];
    
}

/*!
 *  @brief  创建线程下载图片
 *
 *  @param btn 按钮
 *
 *  @since
 */
-(void)showImage:(UIButton *)btn{
    NSString *url=@"http://www.crazyit.org/logo.jpg";
    //创建新线程对象
    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(downloadImageFromurl:) object:url];
    //启动线程
    [thread start];
}

/*!
 *  @brief  下载图片
 *
 *  @param url <#url description#>
 *
 *  @since <#version number#>
 */
-(void)downloadImageFromurl:(NSString *)url{
//从网络获取数据
    NSData *data=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
    //将网络数据转化为UIImage对象
    UIImage *image=[[UIImage alloc]initWithData:data];
    
    if(image!=nil){
       //在主线程上执行UpdateUI的方法
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    }else{
        NSLog(@"下载图片错误...");
    }
}

-(void)updateUI:(UIImage *)img{
    self.imgView.image=img;
}




@end
