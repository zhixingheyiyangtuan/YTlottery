//
//  LOListDetailVC.m
//  lottery
//
//  Created by 杨湍 on 2017/6/2.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOListDetailVC.h"
#import "AFNHttpTools.h"
#import "LOListDetailModel.h"
#import "LOListDetailCell.h"

@interface LOListDetailVC ()

@property(nonatomic,strong)LOListDetailModel * lOListDetailModel;
@property(nonatomic,strong)NSMutableArray *listDetailArray;
@property(nonatomic,assign)NSInteger item;

@end

@implementation LOListDetailVC

-(NSMutableArray *)listDetailArray{

    if (!_listDetailArray) {
        _listDetailArray = [NSMutableArray array];
    }

    return _listDetailArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//     [self showLoadingViewWithMessage:@"正在加载中。。"];
    self.title = self.listModel.title;
    self.meTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //设置背景图片
//    self.meTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
    self.meTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    [self.view addSubview:self.meTableView];
    
    [self addRefreshControl];
    
}


// 刷新控件的配置
-(void)addRefreshControl
{
    self.meTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.meTableView.mj_header beginRefreshing];
    self.meTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}


#pragma mark - 和服务器相关
-(void)loadNewData
{
    self.item = 5;
    [self requestToServer];
}



-(void)loadMoreData
{
    
    [self requestToServer];
}

-(void)requestToServer{
    
    NSString *tempUrl = [NSString stringWithFormat:@"%@%@-%ld.json",lotteryListDetail,self.listModel.url,(long)self.item];
    
    NSLog(@"%@",tempUrl);
    
    [AFNHttpTools getDataWithUrl:tempUrl andParameters:nil successed:^(NSDictionary *dict) {
            NSLog(@"%@",dict);
        if (self.item <= 20) {
             self.item = self.item + 5;
        }
//            [self hideLoadingView];
        
            self.lOListDetailModel = [LOListDetailModel mj_objectWithKeyValues:dict];
        
         NSMutableArray *tempArray =  [LOListDetailDataModel mj_objectArrayWithKeyValuesArray:self.lOListDetailModel.data];
        
        [self.listDetailArray removeAllObjects];
       
        [self.listDetailArray addObjectsFromArray:tempArray];
//
//            self.detailModel = detailModel;
//            [self createData];
        
            [self.meTableView reloadData];
            
        // 让刷新控件停止显示刷新状态
        [self.meTableView.mj_header endRefreshing];
        [self.meTableView.mj_footer endRefreshing];
     
        if (self.item == 25) {
             [self.meTableView.mj_footer endRefreshingWithNoMoreData];
        }
       
    } failed:^(NSError *err) {
        [self hideLoadingView];
        // 让刷新控件停止显示刷新状态
        [self.meTableView.mj_header endRefreshing];
        [self.meTableView.mj_footer endRefreshing];

//        [self showErrorMessage:@"加载数据失败"];
        
    }];
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listDetailArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LOListDetailDataModel *dataModel = self.listDetailArray[indexPath.row];
    LOListDetailCell *cell = [LOListDetailCell LOCell:tableView];
    
    cell.dataModel = dataModel;
    cell.index = indexPath;

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return CELLHEIGHT;


}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001*autoSizeScaleY;
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.001*autoSizeScaleY;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}


@end
