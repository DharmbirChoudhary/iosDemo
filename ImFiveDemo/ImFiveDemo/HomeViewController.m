//
//  HomeViewController.m
//  ImFiveDemo
//
//  Created by Andrew on 14/12/4.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "QHCommonUtil.h"
#import "QHViewTag.h"
#import "SettingViewController.h"

@interface HomeViewController ()
@property (nonatomic,strong)UITabBarController *tabC;

@property (nonatomic,strong)UIImageView *imgView1;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationItem.title=@"title";
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"换肤" style:UIBarButtonItemStylePlain target:self action:@selector(changeTheme:)];
    self.navigationItem.rightBarButtonItem=item;
    
    [self addObserver];
    [self initView];
    
}

-(void)changeTheme:(UIBarButtonItem *)item{
    SettingViewController *setting=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}

-(void)initView{
    
    _tabC=[[UITabBarController alloc]init];
    _tabC.tabBar.backgroundColor=[UIColor clearColor];
    _tabC.view.frame=self.view.frame;
    [self.view addSubview:_tabC.view];
    
    FirstViewController *first=[[FirstViewController alloc]init];
    first.baseNavigation=self.navigationController;
    first.title=@"123";

    SecondViewController *second=[[SecondViewController alloc]init];
    second.baseNavigation=self.navigationController;
    
    ThirdViewController *third=[[ThirdViewController alloc]init];
    third.baseNavigation=self.navigationController;
    
    _tabC.viewControllers=@[first,second,third];
    [self reloadImage];
    
    UIImage *img=[QHCommonUtil imageNamed:@"buddy_header_icon_group"];
    _imgView1=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, img.size.width,img.size.height)];
    _imgView1.image=img;
    [self.view addSubview:_imgView1];
    
}
-(void)reloadImage{
    [super reloadImage];
    NSString *imageName = nil;
    if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1 && [QHConfiguredObj defaultConfigure].nThemeIndex != 0)
    {
        imageName = @"tabbar_bg_ios7.png";
    }else
    {
        imageName = @"tabbar_bg.png";
    }
    [_tabC.tabBar setBackgroundImage:[QHCommonUtil imageNamed:imageName]];
    NSArray *ar=_tabC.viewControllers;
    NSMutableArray *muAr=[[NSMutableArray alloc]init];
    [ar enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        UITabBarItem *item=nil;
        switch (idx) {
            case 0:
            {
                item = [[UITabBarItem alloc] initWithTitle:@"消息" image:[[QHCommonUtil imageNamed:@"tab_recent_nor.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[QHCommonUtil imageNamed:@"tab_recent_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            }
            case 1:
            {
                item = [[UITabBarItem alloc] initWithTitle:@"联系人" image:nil tag:1];
                [item setImage:[[QHCommonUtil imageNamed:@"tab_buddy_nor.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                [item setSelectedImage:[[QHCommonUtil imageNamed:@"tab_buddy_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            }
            case 2:
            {
                item = [[UITabBarItem alloc]initWithTitle:@"动态" image:nil tag:1];
                [item setImage:[[QHCommonUtil imageNamed:@"tab_qworld_nor.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                [item setSelectedImage:[[QHCommonUtil imageNamed:@"tab_qworld_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            }
        }
        obj.tabBarItem=item;
        [muAr addObject:obj];
    }];
    _tabC.viewControllers=muAr;
    [self reloadViewImg];
}

-(void)reloadViewImg{
    UIImage *img=[QHCommonUtil imageNamed:@"buddy_header_icon_qzone"];

    _imgView1.image=img;
}


@end
