//
//  LOHomeDetailTopCell.h
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOHomeItemDetailModel.h"
@interface LOHomeDetailTopCell : UITableViewCell

@property(nonatomic,strong) LOHomeItemDetailTopModel *topModel;



/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView;

@end
