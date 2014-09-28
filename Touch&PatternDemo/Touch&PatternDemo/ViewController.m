//
//  ViewController.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

-(void)initView{
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIHT-50, SCREEN_WIDTH, 50)];
    [self.view addSubview:toolBar];
    toolBar.backgroundColor=[UIColor purpleColor];
    
    UIBarButtonItem *startItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *endItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *space1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    UIBarButtonItem *space2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    UIBarButtonItem *space3=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    UIBarButtonItem *space4=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    UIBarButtonItem *space5=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    //回收站
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(itemClick:)];
    
    //保存
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"save"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //打开
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"open"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //颜色
    UIBarButtonItem *item4=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"palette"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //undo
    UIBarButtonItem *item5=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"undo"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    //redo
    UIBarButtonItem *item6=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"redo"] style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];

    toolBar.items=@[startItem,item1,space1,item2,space2,item3,space3,item4,space4,item5,space5,item6,endItem];
    

}

-(void)itemClick:(id)sender{
    NSLog(@"clicked");
}
@end
