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
    
            LOHomeItemDetailModel *tenP  = [LOHomeItemDetailModel mj_objectWithKeyValues:dict[@"result"]];
    
            NSLog(@"====%@",tenP);
    
        }
    
        
        
    } failed:^(NSError *err) {
        
    }];
    


}



- (void)viewDidLoad {
   [super viewDidLoad];

    [self createUI];
}

-(void)createUI{
  
    [self.view addSubview:self.meTableView];
    [self.meTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];

}

#pragma -mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
    
        return 6;
    
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        LOHomeDetailTopCell *cell = [LOHomeDetailTopCell LOCell:tableView];
        return cell;
    }else{
    
    
        LOHomeDetailTopCell *cell = [LOHomeDetailTopCell LOCell:tableView];
        return cell;
    }
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44;

}

@end
