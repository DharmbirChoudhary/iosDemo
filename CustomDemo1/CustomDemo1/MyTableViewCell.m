//
//  MyTableViewCell.m
//  CustomDemo1
//
//  Created by Andrew on 14-8-27.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       
        
        NSLog(@"表格Bouns：%@",NSStringFromCGRect(self.bounds));
        NSLog(@"表格Rect：%@",NSStringFromCGRect(self.frame));
        
        _leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 110)];
        [_leftBtn setBackgroundColor:[UIColor purpleColor]];
        _leftBtn.titleLabel.lineBreakMode=UILineBreakModeWordWrap;
        _leftBtn.titleLabel.numberOfLines=0;
        _leftBtn.showsTouchWhenHighlighted=YES;
        [_leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftBtn];
        
        
        _originRect=CGRectMake(CGRectGetMaxX(_leftBtn.frame), 0, self.frame.size.width-_leftBtn.frame.size.width-5, 110);
        _cellRect=CGRectMake(CGRectGetMaxX(_leftBtn.frame)-300, 0, self.frame.size.width-_leftBtn.frame.size.width-5, 110);
        //创建自定义的view
        _myView=[[CustomView alloc]initWithFrame:_originRect];
        [self addSubview:_myView];
        
        [self bringSubviewToFront:_leftBtn];
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.selectionStyle=UITableViewCellSelectionStyleNone;

    // Configure the view for the selected state
}

-(void)setDataSouce:(NSDictionary*)dict{
    NSString *name=dict[@"name"];
    NSArray *itemArray=dict[@"item"];
    [_leftBtn setTitle:name forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //重新设置一下高度
    _leftBtn.frame=CGRectMake(_leftBtn.frame.origin.x, _leftBtn.frame.origin.y, _leftBtn.frame.size.width, itemArray.count*35);
    _myView.frame=CGRectMake(_myView.frame.origin.x, _myView.frame.origin.y, _myView.frame.size.width,itemArray.count*35);
    
    _originRect=CGRectMake(CGRectGetMaxX(_leftBtn.frame), 0, self.frame.size.width-_leftBtn.frame.size.width-5, itemArray.count*35);
    _cellRect=CGRectMake(CGRectGetMaxX(_leftBtn.frame)-300, 0, self.frame.size.width-_leftBtn.frame.size.width-5, itemArray.count*35);
    //赋值
    [_myView setData:itemArray];
    
}

-(void)btnClick:(UIButton*)btn{
    NSLog(@"点击了");
    btn.selected=!btn.selected;
    [UIView animateWithDuration:0.5f animations:^{
        if(btn.selected){
            _myView.frame=_cellRect;
        }else{
            _myView.frame=_originRect;
        }
    } completion:^(BOOL finished) {
        
    }];
}

@end
