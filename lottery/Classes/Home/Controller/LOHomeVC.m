//
//  LOHomeVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//


#import "LOHomeMainModel.h"


#import "LOHomeMainItemView.h"

#import "LOHomeVC.h"
#import "LOHomeItemDetailVC.h"

@interface LOHomeVC ()<LOHomeMainItemViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)LOHomeMainItemView *mainItemView;
@property (nonatomic,strong)NSArray * collectionArr;

@end

@implementation LOHomeVC

-(LOHomeMainItemView *)mainItemView{

    if (_mainItemView == nil) {
        _mainItemView = [[LOHomeMainItemView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 2 * MainItemHeight)];
        _mainItemView.delegate = self;
    }

    return _mainItemView;

}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 访问本地plist文件获取数据源
   
    self.mainItemView.collectionArr = [LOHomeMainModel mj_objectArrayWithFilename:@"HomePage.plist"];
    
     [self.view addSubview:self.mainItemView];
     self.automaticallyAdjustsScrollViewInsets = NO;
}



#pragma -mark LOHomeMainItemViewDelegate
-(void)LOHomeMainItemViewDidSelectWith:(LOHomeMainModel *)model{

    
   LOHomeItemDetailVC * DetailVC = [[LOHomeItemDetailVC alloc]init];
    
    DetailVC.mainModel = model;
    [self.navigationController pushViewController:DetailVC animated:YES];
    
    
   

}



@end
