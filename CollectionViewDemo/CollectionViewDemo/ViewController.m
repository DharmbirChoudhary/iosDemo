//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by Andrew on 14-10-24.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyResusableView.h"

#define  HEADERID @"headerId"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)NSArray *arrayData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _arrayData=@[@"中国",@"美国",@"德国",@"捷克"];
    [self initCollectionView];
}

-(void)initCollectionView{
    
    

    
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    layout.sectionInset=UIEdgeInsetsMake(15, 5, 25, 5);
    layout.headerReferenceSize=CGSizeMake(80, 40);
    
    CGRect rect=CGRectMake(0, 150, 320, 300);
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"CellId"];
    [collectionView registerClass:[MyResusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERID];;
   
    
    collectionView.dataSource=self;
    collectionView.delegate=self;
    collectionView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:collectionView];
    
//    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0,0, 320, 100)];
//    topView.backgroundColor=[UIColor greenColor];
//    [collectionView addSubview:topView];
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrayData.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 15;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identity=@"CellId";
    NSLog(@"section:%d",indexPath.section);
    if(indexPath.section==0){
    
    }
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    
    
    
    
    if(indexPath.row==0){
        cell.nameLb.text=@"哈哈";
        cell.backgroundColor=[UIColor purpleColor];
    }else{
        cell.nameLb.text=_arrayData[indexPath.row];
        cell.backgroundColor=[UIColor redColor];
    }
    
   
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *headerId=HEADERID;

    MyResusableView *view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
    
    
    view.nameLb.text=[NSString stringWithFormat:@"test:%ld",(long)indexPath.section];
    if(indexPath.section==0){

        UIImage *img=[UIImage imageNamed:@"HomeBanner"];
        view.picImgView.image=img;
    }else{
        view.picImgView.image=nil;
    }
    
    view.backgroundColor=[UIColor blueColor];
    
    return view;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"message" message:@"succeed" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}











@end
