//
//  PaletteViewController.m
//  Touch&PatternDemo
//
//  Created by Andrew on 14-9-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "PaletteViewController.h"
#import "SetStrokeColorCommand.h"

@interface PaletteViewController ()

@end

@implementation PaletteViewController


-(void)viewDidDisappear:(BOOL)animated{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setFloat:[_redSlider value] forKey:@"red"];
    [userDefault setFloat:_greenSlider.value forKey:@"green"];
    [userDefault setFloat:_blueSlider.value forKey:@"blue"];
    [userDefault setFloat:_sizeSlider.value forKey:@"size"];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}



@end
