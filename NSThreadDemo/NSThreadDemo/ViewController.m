//
//  ViewController.m
//  NSThreadDemo
//
//  Created by Andrew on 14-9-23.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self threadRoutine];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)threadRoutine
{
    
    BOOL moreWorkToDo = YES;
    BOOL exitNow = NO;
    NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
    
    NSMutableDictionary* threadDict = [[NSThread currentThread] threadDictionary];
    [threadDict setValue:[NSNumber numberWithBool:exitNow] forKey:@"ThreadShouldExitNow"];
    
    //添加事件源
//    [self myInstallCustomInputSource];
    
    while (moreWorkToDo && !exitNow)
    {
        //执行线程真正的工作方法，如果完成了可以设置moreWorkToDo为False
        
        [runLoop runUntilDate:[NSDate date]];
        
        exitNow = [[threadDict valueForKey:@"ThreadShouldExitNow"] boolValue];
    }
    
}

@end
