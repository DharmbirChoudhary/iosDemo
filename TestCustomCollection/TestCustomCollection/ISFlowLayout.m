//
//  ISFlowLayout.m
//  JuNiuProject
//
//  Created by Andrew on 14/12/11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ISFlowLayout.h"
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.5
@implementation ISFlowLayout
-(id)init{
    self=[super init];
    if(self){
      //设置每个单元格的大小
        self.itemSize=CGSizeMake(154, 200);
        //设置改控件的推动方向
        self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        //设置各分区上，下，左右保留的空白区的大小
        self.sectionInset=UIEdgeInsetsMake(120, 0, 120, 0);
        //设置单元格的最小的行间距
        self.minimumLineSpacing=50;
    }
    return self;
}
/*! MacBook Pro 2014-12-11 16:08 编辑
 *  @brief  该方法的返回值决定当UICollectionView的bounds改变时，是否需要重新布局
 *
 *  @param newBounds <#newBounds description#>
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
/*! MacBook Pro 2014-12-11 16:09 编辑
 *  @brief  改方法的返回值控制指定CGRect区域内各单元格的大小，位置等布局属性
 *
 *  @param rect
 *
 *  @return <#return value description#>
 *
 *  @since <#version number#>
 */
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *arraty=[super layoutAttributesForElementsInRect:rect];
    //定义一个rect,用来记录该UICollectionView的可视区域
    CGRect visibleRect;
    //设置visibleRect的原点等于contentView的偏移
    visibleRect.origin=self.collectionView.contentOffset;
    //设置visibleRect的大小与contentView的大小相同
    visibleRect.size=self.collectionView.bounds.size;
    for (UICollectionViewLayoutAttributes *attributes in arraty) {
        //用可视区域的中心减去当前单元格控件的中心，得到该单元格与中心的距离
        CGFloat distance=CGRectGetMidX(visibleRect)-attributes.center.x;
        //如果该单元格的中心的距离小于指定值，就对该控件进行放大
        if(ABS(distance)<ACTIVE_DISTANCE){
           //计算放大比例：该单元格与中心的距离越大，放大比例就越小
            CGFloat zoom=1+ZOOM_FACTOR*(1-ABS(distance/ACTIVE_DISTANCE));
            attributes.transform3D=CATransform3DMakeScale(zoom, zoom, 1);
            attributes.zIndex=1;
        }
    }
    return arraty;
}
@end





























