//
//  LOweChatListCell.h
//  lottery
//
//  Created by 杨湍 on 2017/6/5.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LOWeChatListModel.h"
#define CELLHEIGHT 80 *autoSizeScaleY

@interface LOweChatListCell : UITableViewCell

/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView;

@property(nonatomic,strong)LOWeChatListModel *weChatModel;

@end
