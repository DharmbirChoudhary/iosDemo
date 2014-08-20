//
//  FKViewController.h
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "FKDashView.h"

typedef struct {
    CGFloat pattern[5];
    size_t count;
}Pattern;

static Pattern patterns[]={
    {{10,10},2},
    {{10,20,10},3},
    {{10,20,20},3},
    {{10,20,10,30},4},
    {{10,20,20,30},4},
    {{10,20,20,30,50},5},
};

static NSInteger patternCount=sizeof(patterns)/sizeof(patterns[0]);



@interface FKViewController : ViewController

@end
