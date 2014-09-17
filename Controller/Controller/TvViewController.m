//
//  FirstViewController.m
//  Controller
//
//  Created by lws on 14-8-24.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#import "TvViewController.h"
#include "NetWorkDelegate.h"

@interface TvViewController ()

@property (nonatomic,strong)UIButton *volAddBtn;
@property (nonatomic,strong)UIButton *volMinusBtn;

@property (nonatomic,strong)UIButton *chUpBtn;
@property (nonatomic,strong)UIButton *chDownBtn;

@end

@implementation TvViewController
- (IBAction)triggSignal:(UIButton *)sender {
        
        NSString *message = [[NSString alloc] initWithFormat:@"%ld", (long)sender.tag];
        NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
        [[NetWorkDelegate sharedInstance] sendRawData:data callBack:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIView *volView=[[UIView alloc]initWithFrame:CGRectMake(54, 64, 72, 125)];
    [self.view addSubview:volView];
    
    UIImage *volImg=[UIImage imageNamed:@"voice"];
    UIImageView *volImgView=[[UIImageView alloc]initWithFrame:volView.bounds];
    volImgView.image=volImg;
    [volView addSubview:volImgView];
    
    //voice up
    _volAddBtn=[[UIButton alloc]initWithFrame:CGRectMake(16, 0, 46, 60)];
    [_volAddBtn addTarget:self action:@selector(triggSignal:) forControlEvents:UIControlEventTouchUpInside];
    _volAddBtn.tag=12;
    _volAddBtn.showsTouchWhenHighlighted=YES;
    [volView addSubview:_volAddBtn];
   
    //voice down
    _volMinusBtn=[[UIButton alloc]initWithFrame:CGRectMake(16, 68, 46, 60)];
    _volMinusBtn.tag=13;
    _volMinusBtn.showsTouchWhenHighlighted=YES;
    [_volMinusBtn addTarget:self action:@selector(triggSignal:) forControlEvents:UIControlEventTouchUpInside];
    [volView addSubview:_volMinusBtn];
    
    //======
    UIView *chView=[[UIView alloc]initWithFrame:CGRectMake(194, 64, 72, 125)];
    [self.view addSubview:chView];
    
    UIImage *chImg=[UIImage imageNamed:@"channel"];
    UIImageView *chImgView=[[UIImageView alloc]initWithFrame:chView.bounds];
    chImgView.image=chImg;
    [chView addSubview:chImgView];
    _chUpBtn=[[UIButton alloc]initWithFrame:CGRectMake(13, 0, 46, 60)];
    [_chUpBtn addTarget:self action:@selector(triggSignal:) forControlEvents:UIControlEventTouchUpInside];
    _chUpBtn.tag=13;
    _chUpBtn.showsTouchWhenHighlighted=YES;
    [chView addSubview:_chUpBtn];
    
    _chDownBtn=[[UIButton alloc]initWithFrame:CGRectMake(13, 65, 46, 60)];
    _chDownBtn.tag=14;
    [_chDownBtn addTarget:self action:@selector(triggSignal:) forControlEvents:UIControlEventTouchUpInside];
    [chView addSubview:_chDownBtn];
    _chDownBtn.showsTouchWhenHighlighted=YES;
    
    if(iPhone5){
        volView.frame=CGRectMake(volView.frame.origin.x, volView.frame.origin.y+50, volView.frame.size.width, volView.frame.size.height);
        chView.frame=CGRectMake(chView.frame.origin.x, chView.frame.origin.y+50, chView.frame.size.width, chView.frame.size.height);
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
