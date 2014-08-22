//
//  ViewController.m
//  ThreadDemo
//
//  Created by Andrew on 14-8-22.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "ThreadViewController.h"
#import "GlobalConfig.h"
#import "WithDrawViewController.h"
#import "GCDViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 70, SCREEN_WIDTH-40, 30)];
    [btn setTitle:@"Thread线程" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(threadDemo:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    //-------
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(20, 70+50, SCREEN_WIDTH-40, 30)];
    [btn1 setTitle:@"模拟存取钱" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(DrawDemo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    //-------
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(20, 70+50, SCREEN_WIDTH-40, 30)];
    [btn2 setTitle:@"GCD" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    btn2.tag=1;
    [btn2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(skipToPageVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    
}

-(void)threadDemo:(UIButton *)btn{
    ThreadViewController *threadVC=[[ThreadViewController alloc]init];
    [self.navigationController pushViewController:threadVC animated:YES];

}
-(void)DrawDemo:(UIButton *)btn{
    WithDrawViewController *drawVC=[[WithDrawViewController alloc]init];
    [self.navigationController pushViewController:drawVC animated:YES];
}

-(void)skipToPageVC:(UIButton*)btn{

    switch (btn.tag) {
        case 1:{
            GCDViewController *vc=[[GCDViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}



@end
