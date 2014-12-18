//
//  SettingViewController.m
//  ImFiveDemo
//
//  Created by Andrew on 14/12/4.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "SettingViewController.h"
#import "SelectThemeCollectionViewCell.h"
#import "QHConfiguredObj.h"
#import "QHCommonUtil.h"
#import "QHViewTag.h"

#define  IDENTITY @"CELL"

@interface SettingViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *arrayData;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    _arrayData=@[@[@"默认", @"", @"theme_icon.png"],
                 @[@"海洋", @"com.skin.1110", @"theme_icon_sea.png"],
                 @[@"外星人", @"com.skin.1114", @"theme_icon_universe.png"],
                 @[@"小黄鸭", @"com.skin.1108", @"theme_icon_yellowduck.png"],
                 @[@"企鹅", @"com.skin.1098", @"theme_icon_penguin.png"]];
    [self initCollectionView];
}
-(void)initCollectionView{
    
    UIImage *img=[UIImage imageNamed:@"theme_icon"];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize=CGSizeMake(img.size.width*2, img.size.height*2);
    
    CGRect rect=CGRectMake(0, 74, 320, 480-64);
    _collectionView=[[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [_collectionView registerClass:[SelectThemeCollectionViewCell class] forCellWithReuseIdentifier:IDENTITY];
    _collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrayData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SelectThemeCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:IDENTITY forIndexPath:indexPath];
    
    [cell setDataForView:[_arrayData objectAtIndex:indexPath.row] index:indexPath];
    
    return cell;
                                
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *ar=_arrayData[indexPath.row];
    [QHConfiguredObj defaultConfigure].nThemeIndex=indexPath.row;
    [QHConfiguredObj defaultConfigure].themefold=[ar objectAtIndex:1];
    [_collectionView reloadData];
    
    if ([ar objectAtIndex:1] != nil && ((NSString *)[ar objectAtIndex:1]).length > 0)
        [QHCommonUtil unzipFileToDocument:[ar objectAtIndex:1]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RELOADIMAGE object:nil];
}




@end
