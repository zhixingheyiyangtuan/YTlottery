//
//  LOHomeMainItemView.m
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeMainItemView.h"
#import "LOHomeMainModel.h"

@interface LOHomeMainItemView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation LOHomeMainItemView

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView=[[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        //注册Cell，必须要有
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
            }

    return self;

}

-(void)layoutSubviews{

    self.collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 2 *MainItemHeight);
    [self addSubview:self.collectionView];


}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectionArr.count;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LOHomeMainModel *tempModel = self.collectionArr[indexPath.item];
    
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor yellowColor];
    
//        cell.layer.borderWidth = 0.5;
//        cell.layer.borderColor = [[UIColor grayColor] CGColor];
    
    for (id subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    UIImageView *image = [[UIImageView alloc] init];
    image.backgroundColor = [UIColor clearColor];
    image.userInteractionEnabled = YES;
    image.contentMode = UIViewContentModeScaleAspectFit;
    image.image = [UIImage imageNamed:tempModel.image];
    [cell.contentView addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(cell.mas_centerX);
        make.centerY.mas_equalTo(cell.mas_centerY).offset(-10);
        make.height.mas_equalTo(@(28 *autoSizeScaleX));
        make.width.mas_equalTo(@(28 * autoSizeScaleX));
        
    }];
    
    
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    //     label.backgroundColor = [UIColor greenColor];
    
    label.font = FontWithSize(14);
    [cell.contentView addSubview:label];
    label.text = tempModel.text;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(cell.mas_centerX);
        make.centerY.equalTo(cell.mas_centerY).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH/4);
        make.height.mas_equalTo(@(20 * autoSizeScaleX));
        
    }];
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/4,MainItemHeight);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}



#pragma mark --UICollectionViewDelegate


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     LOHomeMainModel *tempModel = self.collectionArr[indexPath.item];
    
    if (_delegate && [_delegate respondsToSelector:@selector(LOHomeMainItemViewDidSelectWith:)]) {
        [_delegate LOHomeMainItemViewDidSelectWith:tempModel];
    }
    
}



@end
