//
//  LOMessageVC.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOMessageVC.h"
#import "LOListModel.h"
#import "LOListDetailVC.h"
@interface LOMessageVC ()

@property(nonatomic,strong)NSArray *lotteryArray;

@end

@implementation LOMessageVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lotteryArray = [LOListModel mj_objectArrayWithFilename:@"LotteryList.plist"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.meTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //设置背景图片
//    self.meTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
    [self.view addSubview:self.meTableView];
}

#pragma -mark UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.lotteryArray.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LOListModel *listModel = self.lotteryArray[indexPath.row];
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.textLabel.text = listModel.title;
    
    
    cell.textLabel.textColor = LOColor(127, 109, 84, 1);
    cell.detailTextLabel.textColor = LOColor(144, 123, 94, 1);
    
    return cell;



}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.001*autoSizeScaleY;

}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001*autoSizeScaleY;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LOListModel *listModel = self.lotteryArray[indexPath.row];
    
   LOListDetailVC *detailVC =  [[LOListDetailVC alloc]init];
    
    detailVC.listModel = listModel;
    
    [self.navigationController pushViewController:detailVC animated:YES];


}
@end
