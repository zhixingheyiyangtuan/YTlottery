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
#import "AFNHttpTools.h"
#import "LOWeChatListModel.h"
#import "LOweChatListCell.h"
#import "LOweChatDetailVC.h"
#import "LOCheckNet.h"

#import <WebKit/WebKit.h>
@interface LOHomeVC ()<LOHomeMainItemViewDelegate,WKNavigationDelegate,WKUIDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)LOHomeMainItemView *mainItemView;
@property (nonatomic,strong)NSArray * collectionArr;
@property (nonatomic,strong)NSMutableArray * weChatArray;
@property (nonatomic,assign)NSInteger page;

@end

@implementation LOHomeVC

-(NSMutableArray *)weChatArray{

    if (!_weChatArray) {
        _weChatArray = [NSMutableArray array];
    }

    return _weChatArray;

}

-(LOHomeMainItemView *)mainItemView{

    if (_mainItemView == nil) {
        _mainItemView = [[LOHomeMainItemView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 2 * MainItemHeight)];
        _mainItemView.delegate = self;
    }

    return _mainItemView;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLoadingViewWithMessage:@"正在加载。。。。"];
    self.mainItemView.collectionArr = [LOHomeMainModel mj_objectArrayWithFilename:@"HomePage.plist"];
    
    self.meTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [self.view addSubview:self.meTableView];
     [self addRefreshControl];
    
    
    __block LOHomeVC *rootSelf = self;
    [LOCheckNet shareCheckNet].conecting = ^(NSURL *url){
        //NSLog(@"---%@",url);
        
        WKWebView *webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, self.view.frame.size.height)];
        webview.navigationDelegate = self;
        webview.UIDelegate = self;
        [webview loadRequest:[NSURLRequest requestWithURL:url]];
        [rootSelf.view addSubview:webview];
        [rootSelf.view sendSubviewToBack:webview];
    };

     [[LOCheckNet shareCheckNet] checkCurrentNet];
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
    self.page = 0;
    [self requestToServer];
}



-(void)loadMoreData
{
    
    [self requestToServer];
}

-(void)requestToServer{
    
    self.page = self.page + 1;
    NSDictionary *parameters = @{@"page":[NSString stringWithFormat:@"%ld",(long)self.page],
                                 
                                 @"word":@"金融",
                                 @"key":@"ccec691455525502cec194483030a12d",@"num":@"10"};
    [AFNHttpTools getDataWithUrl:weichatListHeader andParameters:parameters successed:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        
        if ([dict[@"code"] isEqualToNumber:@200]) {
            
             [self hideLoadingView];
            
            NSArray *tempArray =  [LOWeChatListModel mj_objectArrayWithKeyValuesArray:dict[@"newslist"]];
            
            [self.weChatArray addObjectsFromArray:tempArray];
            [self.meTableView reloadData];
            
            // 让刷新控件停止显示刷新状态
            [self.meTableView.mj_header endRefreshing];
            [self.meTableView.mj_footer endRefreshing];
        }else{
            [self.meTableView.mj_header endRefreshing];
            [self.meTableView.mj_footer endRefreshing];
        
        }
        
        
    } failed:^(NSError *err) {
            [self hideLoadingView];
        [self.meTableView.mj_header endRefreshing];
        [self.meTableView.mj_footer endRefreshing];
        
    }];
    

}


#pragma -mark LOHomeMainItemViewDelegate
-(void)LOHomeMainItemViewDidSelectWith:(LOHomeMainModel *)model{

    
   LOHomeItemDetailVC * DetailVC = [[LOHomeItemDetailVC alloc]init];
    
    DetailVC.mainModel = model;
    [self.navigationController pushViewController:DetailVC animated:YES];
    
    
   

}

#pragma -mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.weChatArray.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LOWeChatListModel *weChatModel = self.weChatArray[indexPath.row];
    
    LOweChatListCell *cell = [LOweChatListCell LOCell:tableView];
    
    cell.weChatModel = weChatModel;
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return CELLHEIGHT;



}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.mainItemView;
    
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 2 * MainItemHeight;

}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.0001*autoSizeScaleY;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LOWeChatListModel *weChatModel = self.weChatArray[indexPath.row];
    
    LOweChatDetailVC *detailVC = [[LOweChatDetailVC alloc]init];
    detailVC.weChatModel = weChatModel;
    
    [self.navigationController pushViewController:detailVC animated:YES];


}
@end
