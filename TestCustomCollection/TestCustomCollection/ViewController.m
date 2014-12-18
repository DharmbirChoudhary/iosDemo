//
//  ViewController.m
//  TestCustomCollection
//
//  Created by Andrew on 14/12/11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "ISFlowLayout.h"
#import "ISCollectionViewCell.h"
#define kCELLID @"cell"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *headCollectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建自定义ISFloyout布局管理器对象
    ISFlowLayout *flowlayout=[[ISFlowLayout alloc]init];
    self.headCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) collectionViewLayout:flowlayout];
    self.headCollectionView.dataSource=self;
    self.headCollectionView.delegate=self;
    [self.view addSubview:_headCollectionView];
    [self.headCollectionView registerClass:[ISCollectionViewCell class] forCellWithReuseIdentifier:kCELLID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ISCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kCELLID forIndexPath:indexPath];
    cell.nameLb.text=[NSString stringWithFormat:@"%ld",(long)indexPath.item];
    return cell;
}


@end
