//
//  LOListDetailCell.h
//  lottery
//
//  Created by 杨湍 on 2017/6/2.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LOListDetailModel.h"

#define CELLHEIGHT 90*autoSizeScaleY;

@interface LOListDetailCell : UITableViewCell

/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView;

@property(nonatomic,strong)LOListDetailDataModel *dataModel;

@property(nonatomic,strong)NSIndexPath *index;
@end
