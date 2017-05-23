//
//  LOHomeItemDetailVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeItemDetailVC.h"
#import "AFNHttpTools.h"
#import "LOHomeItemDetailModel.h"
#import "LOHomeDetailTopCell.h"
@interface LOHomeItemDetailVC ()

@property (nonatomic,strong)NSArray *topArray;

@property (nonatomic,strong)LOHomeItemDetailModel *detailModel;



@end

@implementation LOHomeItemDetailVC

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    
     [self  requestToServer];


}

-(void)requestToServer{

    NSDictionary * paramDic = [NSDictionary dictionary];
    
    //      paramDic = @{@"period":@"2017056",
    //                   @"name":@"双色球"};
    paramDic = @{
                 @"name":self.mainModel.text};
    
    [AFNHttpTools getDataWithUrl:lotteryRequestHeader andParameters:paramDic successed:^(NSDictionary *dict) {
        //        NSLog(@"%@",dict);
        if ([dict[@"retCode"] isEqualToString:@"200"]) {
            [self hideLoadingView];
            LOHomeItemDetailModel *detailModel  = [LOHomeItemDetailModel mj_objectWithKeyValues:dict[@"result"]];
    
            self.detailModel = detailModel;
             [self createData];
            [self.meTableView reloadData];
    
        }
    
        
        
    } failed:^(NSError *err) {
        
    }];
    


}



- (void)viewDidLoad {
   [super viewDidLoad];
    [self showLoadingViewWithMessage:@"正在加载中。。"];
    [self setNavigationBarTittle:self.mainModel.text];
    
    [self setNavigationBarWithLeftBarItemImage:@"nav_fanhui" rightBarIteImage:nil];
    
    
    
    [self createUI];
}

-(void)createData{
    
  NSString * lotteryNumber = [self.detailModel.lotteryNumber componentsJoinedByString:@","];
    
    NSString *pool = @"暂无数据";
    if (![self.detailModel.pool isEqualToString:@"0"]) {
        pool = self.detailModel.pool;
    }
    
NSArray *topDataArray = @[@{
                          @"itemImage": @"lotteryNumber",
                          @"itemName": @"开奖号码",
                          @"itemContent": lotteryNumber,
                        },
                      
                      @{
                          @"itemImage": @"lotteryPeriod",
                          @"itemName": @"开奖日期",
                          @"itemContent": self.detailModel.awardDateTime,
                          },
                      
                      @{
                          @"itemImage": @"currentSales",
                          @"itemName": @"本期销量",
                          @"itemContent": self.detailModel.sales,
                          },
                      
                      @{
                          @"itemImage": @"currentBonus",
                          @"itemName": @"奖池奖金",
                          @"itemContent": pool,
                          },
                      
                      ];


  self.topArray =  [LOHomeItemDetailTopModel mj_objectArrayWithKeyValuesArray:topDataArray];
    


}

-(void)createUI{
  
    self.meTableView.separatorStyle = NO;
    [self.view addSubview:self.meTableView];
    [self.meTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];

}

-(void)leftButtonItemTapped{
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma -mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.topArray.count;
    }else{
    
        return 6;
    
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        LOHomeItemDetailTopModel *topModel = self.topArray[indexPath.row];
        LOHomeDetailTopCell *cell = [LOHomeDetailTopCell LOCell:tableView];
        if (indexPath.row%2 == 0) {
              cell.contentView.backgroundColor = LOColor(240, 240, 240, 1);
        }
         cell.topModel = topModel;
        
        return cell;
   
    }else{

        LOHomeDetailTopCell *cell = [LOHomeDetailTopCell LOCell:tableView];
        return cell;
    }
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44 *autoSizeScaleY;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];


}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        UILabel *topLabel = [[UILabel alloc]init];
        if (self.detailModel.period) {
              topLabel.text = [NSString stringWithFormat:@"    第%@期",self.detailModel.period];
        }
      
        topLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44 *autoSizeScaleY);
        topLabel.font = FontWithSize(20);
        return topLabel;
        
    }


    return nil;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 44 *autoSizeScaleY;
    }else{
    
     return 0.01 *autoSizeScaleY;
        
    }
    
}

@end
