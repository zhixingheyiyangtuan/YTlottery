//
//  LOHomeVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeVC.h"
#import "LOHomeMainModel.h"
#import "LOHomeMainItemView.h"
#import "AFNHttpTools.h"
#import "LOHomeItemDetailModel.h"

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

    
    NSDictionary * paramDic = [NSDictionary dictionary];
    
//      paramDic = @{@"period":@"2017056",
//                   @"name":@"双色球"};
    paramDic = @{
                 @"name":model.text};
    
    [AFNHttpTools getDataWithUrl:lotteryRequestHeader andParameters:paramDic successed:^(NSDictionary *dict) {
//        NSLog(@"%@",dict);
        if ([dict[@"retCode"] isEqualToString:@"200"]) {
                   
       LOHomeItemDetailModel *tenP  = [LOHomeItemDetailModel mj_objectWithKeyValues:dict[@"result"]];
            
            NSLog(@"====%@",tenP);

        }
        
        
        
    } failed:^(NSError *err) {
        
    }];



}



@end
