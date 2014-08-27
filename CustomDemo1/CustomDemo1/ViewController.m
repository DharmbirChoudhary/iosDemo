//
//  ViewController.m
//  CustomDemo1
//
//  Created by Andrew on 14-8-27.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *myTableView;
@property (nonatomic,strong)NSArray *arrayData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    [self initTableView];
    
    _arrayData=@[@{@"name":@"中国",@"item":@[@"长城",@"木兰围场",@"兵马俑"]},
                 @{@"name":@"美国",@"item":@[@"华盛顿",@"纽约",@"奥巴马"]},
                 @{@"name":@"德国",@"item":@[@"莱茵河",@"贝多芬",@"俾斯麦",@"工业化"]},
                 @{@"name":@"日本",@"item":@[@"富士山",@"东京",@"大阪",@"早稻田大学",@"大和"]},
                 @{@"name":@"意大利",@"item":@[@"一大",@"教堂"]},
                 @{@"name":@"法国",@"item":@[@"埃菲尔铁塔",@"罗浮宫",@"拿破仑"]}];
    
    [self.myTableView reloadData];
}


-(void)initTableView{
    _myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-50)];
    _myTableView.dataSource=self;
    _myTableView.delegate=self;
    [self.view addSubview:_myTableView];
    if ([_myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_myTableView setSeparatorInset:UIEdgeInsetsZero];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrayData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict=_arrayData[indexPath.section];
    NSArray *itmes=[dict objectForKey:@"item"];
    return itmes.count*35;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity=@"cell";
    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if(!cell){
        cell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
    }
    
    
    NSLog(@"哈哈:%@",NSStringFromCGRect(cell.bounds));
    [cell setDataSouce:_arrayData[indexPath.section]];
    
//    cell.backgroundColor=[UIColor orangeColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}
@end
















