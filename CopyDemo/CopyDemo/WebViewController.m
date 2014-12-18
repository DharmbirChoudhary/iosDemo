//
//  WebViewController.m
//  CopyDemo
//
//  Created by Andrew on 14-10-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "WebViewController.h"
#define SCREEN_WIDTH 320
#define SCREEN_HEIHT [[UIScreen mainScreen] currentMode].size.height/2

@interface WebViewController ()
@property (strong, nonatomic)  UIWebView *webView;

@end

@implementation WebViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initWebView];
    
    self.webView.scalesPageToFit=YES;
    
//   NSString *urlStr=@"http://www.baidu.com";
     NSString *urlStr=@"http://www.flybirdsoft.com/m/isoftstone/isoftstone.html";
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.webView loadRequest:request];
    
}

-(void)initWebView{
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIHT)];
    _webView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_webView];
}


@end
