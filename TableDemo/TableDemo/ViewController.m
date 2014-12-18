//
//  ViewController.m
//  TableDemo
//
//  Created by Andrew on 14-11-10.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *arrayData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _arrayData=@[@{@"name":@"中国",@"child":@[@"123",@"123",@"1222",@"123",@"123",@"1222"]},
                 @{@"name":@"美国",@"child":@[@"123",@"123",@"1222"@"123",@"123"]},
                 @{@"name":@"英国",@"child":@[@"123",@"123",@"1222",@"123",@"123",@"1222",@"123",@"123",@"1222",@"12"]},
                @{@"name":@"德国",@"child":@[@"123",@"123",@"1222"]},
                 @{@"name":@"李国",@"child":@[@"123",@"123",@"1222"]}];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 150, 320, 300)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    UIImage *img=[UIImage imageNamed:@"HomeBanner"];
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, img.size.height)];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:headerView.bounds];
    imgView.image=img;
    [headerView addSubview:imgView];
    
    _tableView.tableHeaderView=headerView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return _arrayData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dict=[_arrayData objectAtIndex:section];
    NSArray *array=dict[@"child"];
    int count=array.count%3==0?array.count/3:array.count/3+1;
    return count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSDictionary *dict=_arrayData[indexPath.row];
    NSArray *resultArray=dict[@"child"];
    cell.textLabel.text=resultArray[indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UILabel *lb=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    NSDictionary *dict=_arrayData[section];
    lb.text=dict[@"name"];
    lb.backgroundColor=[UIColor blueColor];
    return lb;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}







@end
