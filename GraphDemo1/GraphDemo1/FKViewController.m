//
//  FKViewController.m
//  GraphDemo1
//
//  Created by Andrew on 14-8-19.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "FKViewController.h"

@interface FKViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    FKDashView *dashView;
    
    UIScrollView *scrollview;
    
    UIPickerView *pickview;
    
    UISlider *phaseSlider;

}

@end

@implementation FKViewController

-(id)init{
    self=[super init];
    if(self){
        self.view.backgroundColor=[UIColor whiteColor];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.view addSubview:scrollview];
    
    phaseSlider =[[UISlider alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(scrollview.frame)+10, 200, 20)];
    [phaseSlider addTarget:self action:@selector(dashPhase:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:phaseSlider];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phaseSlider.frame), phaseSlider.frame.origin.y, 100, 20)];
    [btn setTitle:@"重置" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    dashView=[[FKDashView alloc]initWithFrame:scrollview.bounds];
    [scrollview addSubview:dashView];
    
    [dashView setDashPattern:patterns[0].pattern count:patterns[0].count];
    
    pickview=[[UIPickerView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-200, 320, 100)];
    pickview.dataSource=self;
    pickview.delegate=self;
    pickview.backgroundColor=[UIColor whiteColor];
    [pickview selectRow:0 inComponent:0 animated:YES];
    
    [self.view addSubview:pickview];
    
   
    

}
-(void)dashPhase:(UISlider*)slider{
    dashView.dashPhase=phaseSlider.value;
}
-(void)reset:(UIButton *)btn{
    dashView.dashPhase=0;
    phaseSlider.value=0;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
 }
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return patternCount;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    Pattern p=patterns[row];
    NSMutableString *title=[NSMutableString stringWithFormat:@"%.0f",p.pattern[0]];
    
    for (size_t i=1; i<p.count; ++i) {
        [title appendFormat:@"-%.0f",p.pattern[i]];
    }
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [dashView setDashPattern:patterns[row].pattern count:patterns[row].count];
}

@end
