//
//  LOHomeDetailBottomCell.h
//  lottery
//
//  Created by 杨湍 on 2017/5/24.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOHomeItemDetailModel.h"

@interface LOHomeDetailBottomCell : UITableViewCell

@property(nonatomic,strong)LOHomeLotteryDetailModel *bottomModel;
@property(nonatomic,strong)NSIndexPath *index;

/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView;

@end
