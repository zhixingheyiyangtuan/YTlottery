//
//  LODiscoverVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LODiscoverVC.h"
#import "LOPoetryKind.h"
#import "LOPoetryListVC.h"
#define CELLWIDTH (SCREEN_WIDTH - 10 *autoSizeScaleX)/2
#define CELLHEIGHT CELLWIDTH * 160 / 340


@interface LODiscoverVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

//存储诗词类型
@property (nonatomic, strong) NSArray *poetryArray;

@end

@implementation LODiscoverVC


- (NSArray *)poetryArray {
    if (!_poetryArray) {
        _poetryArray = [LOPoetryKind kinds];
    }
    
    return _poetryArray;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        CGRect rect = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
        
        _collectionView=[[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.bounces = NO;
        _collectionView.scrollEnabled = NO;
        
        //注册Cell，必须要有
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor whiteColor];
    //设置collectionView背景图片
//    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
    [self.view addSubview:self.collectionView];
}


#pragma mark - UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.poetryArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    //设置cell的删除button为隐藏
//    cell.deleteButton.hidden = !_isEditing;
//    //设置代理
//    cell.delegate = self;
    
    LOPoetryKind *poetryKind = self.poetryArray[indexPath.row];
//    cell.backgroundView.image = [UIImage imageNamed:peotryKind.kind];
//    cell.backgroundView
   
    UIImageView *image = [[UIImageView alloc] init];
    image.backgroundColor = [UIColor clearColor];
    image.userInteractionEnabled = YES;
    image.contentMode = UIViewContentModeScaleAspectFit;
    image.image = [UIImage imageNamed:poetryKind.kind];
//    image.frame = cell.contentView.frame;
    [cell.contentView addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(cell.mas_centerX);
        make.centerY.mas_equalTo(cell.mas_centerY);
        make.width.mas_equalTo(CELLWIDTH);
        make.height.mas_equalTo(CELLHEIGHT-20 *autoSizeScaleY);
        
    }];

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LOPoetryKind *poetryKind = self.poetryArray[indexPath.row];
    LOPoetryListVC *poetryListVC = [[LOPoetryListVC alloc] init];
    poetryListVC.kind = poetryKind.kind;
    [self.navigationController pushViewController:poetryListVC animated:YES];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(CELLWIDTH, CELLHEIGHT);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


@end
