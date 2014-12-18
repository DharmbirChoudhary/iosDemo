//
//  QHBasicViewController.m
//  helloworld
//
//  Created by chen on 14/6/30.
//  Copyright (c) 2014年 chen. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "QHBasicViewController.h"
#import "QHViewTag.h"
#import "QHCommonUtil.h"

@interface QHBasicViewController ()
{
    float _nSpaceNavY;
}

@end

@implementation QHBasicViewController

- (id)initWithFrame:(CGRect)frame param:(NSArray *)arParams
{
    self.arParams = arParams;
    
    self = [super init];
    
    [self.view setFrame:frame];
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:TRUE];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(236.f, 236.f, 236.f, 1);
    _statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320, 0.f)];
    _nSpaceNavY = 20;
    if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)
    {
        _statusBarView.frame = CGRectMake(_statusBarView.frame.origin.x, _statusBarView.frame.origin.y, _statusBarView.frame.size.width, 20.f);
        _statusBarView.backgroundColor = [UIColor clearColor];
        ((UIImageView *)_statusBarView).backgroundColor = [UIColor clearColor];
        [self.view addSubview:_statusBarView];
        //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        
        _nSpaceNavY = 0;
    }
}

- (void)createNavWithTitle:(NSString *)szTitle createMenuItem:(UIView *(^)(int nIndex))menuItem
{
}

- (void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerReloadImage:) name:RELOADIMAGE object:nil];
}

- (void)reloadImage
{
    NSString *imageName = nil;
    if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)
    {
        imageName = @"header_bg_ios7.png";
    }else
    {
        imageName = @"header_bg.png";
    }
    UIImage *image = [QHCommonUtil imageNamed:imageName];
    UIImageView *navIV = (UIImageView *)[self.view viewWithTag:98];
    [navIV setImage:image];
}

- (void)observerReloadImage:(NSNotificationCenter *)notif
{
    [self reloadImage:notif];
}

- (void)reloadImage:(NSNotificationCenter *)notif
{
    [self reloadImage];
}

- (void)subReloadImage
{
    NSLog(@"subReloadImage");
}

@end
