//
//  ViewController.m
//  AnimotionDemo
//
//  Created by Andrew on 14-8-21.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CALayer *imageLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //创建一个CAlayer对象
    imageLayer=[CALayer layer];
    //设置边框大小位置
    imageLayer.cornerRadius=6;
    imageLayer.borderColor=[UIColor blackColor].CGColor;
    imageLayer.borderWidth=1;
    imageLayer.masksToBounds=YES;
    
    imageLayer.frame=CGRectMake(30, 30, 100, 135);
    //设置imageLayer显示的图片
    imageLayer.contents=(id)[UIImage imageNamed:@"android"].CGImage;
    [self.view.layer addSublayer:imageLayer];
    
    NSArray *btTitleArray=@[@"位移",@"旋转",@"缩放",@"动画组"];
    //获取屏幕内部的高度
    CGFloat totalHeight=[UIScreen mainScreen].bounds.size.height;
    NSMutableArray *btArray=[[NSMutableArray alloc]init];
    for (int i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(5+i*80, totalHeight-45-20, 70, 35);
        [btn setTitle:btTitleArray[i] forState:UIControlStateNormal];
        [btArray addObject:btn];
        [self.view addSubview:btn];
    }
    
    //为4个按钮绑定不同的处理事件
    [[btArray objectAtIndex:0] addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [[btArray objectAtIndex:1] addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [[btArray objectAtIndex:2] addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [[btArray objectAtIndex:3] addTarget:self action:@selector(group:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)move:(UIButton *)btn{
    CGPoint fromPoint=imageLayer.position;
    CGPoint toPoint=CGPointMake(fromPoint.x+80, fromPoint.y);
    
    //创建不断改变的CaLayer的position属性的属性动画
    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"position"];
    anim.fromValue=[NSValue valueWithCGPoint:fromPoint];//设置动画开始的初始值
    anim.toValue=[NSValue valueWithCGPoint:toPoint];//设置动画的结束的值
    anim.duration=0.5;
    imageLayer.position=toPoint;
    anim.removedOnCompletion=YES;
    [imageLayer addAnimation:anim forKey:nil];
}

-(void)rotate:(UIButton *)btn{
    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromvalue=imageLayer.transform;
     //设置动画开始的属性值
    anim.fromValue=[NSValue valueWithCATransform3D:fromvalue];
    //绕X轴旋转180度
    CATransform3D tovalue=CATransform3DRotate(fromvalue, M_PI, 1, 0, 0);
//    //绕Y轴旋转180度
//    CATransform3D tovalue=CATransform3DRotate(fromvalue, M_PI, 0, 1, 0);
//    //绕Z轴旋转180度
//    CATransform3D tovalue=CATransform3DRotate(fromvalue, M_PI, 0, 0, 1);
    anim.toValue=[NSValue valueWithCATransform3D:tovalue];
    anim.duration=0.5;
    imageLayer.transform=tovalue;
    anim.removedOnCompletion=YES;
    [imageLayer addAnimation:anim forKey:nil];
    
}

-(void)scale:(UIButton *)btn{
    CAKeyframeAnimation *anim=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    //设置CAKeyFrameAnimation 控制transform属性依次经过的值
    anim.values=@[[NSValue valueWithCATransform3D:imageLayer.transform],
                  [NSValue valueWithCATransform3D:CATransform3DScale(imageLayer.transform, 0.2, 0.2, 1)],
                  [NSValue valueWithCATransform3D:CATransform3DScale(imageLayer.transform, 2, 2, 1)],
                  [NSValue valueWithCATransform3D:imageLayer.transform]];
    anim.duration=5;
    anim.removedOnCompletion=YES;
    [imageLayer addAnimation:anim forKey:nil];
    
}

-(void)group:(UIButton *)btn{
    CGPoint fromPoint=imageLayer.position;
    CGPoint toPoint=CGPointMake(280, fromPoint.y+80);
    //创建不断改变的CALayer的position属性的属性动画
    CABasicAnimation *moveAnim=[CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.fromValue=[NSValue valueWithCGPoint:fromPoint];
    moveAnim.toValue=[NSValue valueWithCGPoint:toPoint];
    moveAnim.removedOnCompletion=YES;
    
    //---------
    CABasicAnimation *transAnim=[CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue=imageLayer.transform;
    transAnim.fromValue=[NSValue valueWithCATransform3D:fromValue];
    
    CATransform3D scaleValue=CATransform3DScale(fromValue, 0.5, 0.5, 1);
    
    //绕Z轴方向旋转180度
    CATransform3D rotateValue=CATransform3DRotate(fromValue, M_PI, 0, 0, 1);
    
    //计算两个矩阵的和
    CATransform3D tovalue=CATransform3DConcat(scaleValue, rotateValue);
    
    transAnim.toValue=[NSValue valueWithCATransform3D:tovalue];
    //设置叠加效果
    transAnim.cumulative=YES;
    //动画执行两次，旋转360度
    transAnim.repeatCount=2;
    transAnim.duration=3;
    //位移,缩放，旋转组合起来执行
    CAAnimationGroup *animGroup=[CAAnimationGroup animation];
    animGroup.animations=@[moveAnim,transAnim];
    animGroup.duration=6;
    [imageLayer addAnimation:animGroup forKey:nil];
    
}


@end
