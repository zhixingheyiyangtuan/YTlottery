//
//  LOHomeDetailTopCell.m
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeDetailTopCell.h"

@implementation LOHomeDetailTopCell

/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView
{
    static NSString *const ID = @"LOHomeDetailTopCell";
    LOHomeDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:self forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self setupSubViews];
    }

    return self;
}

-(void)setupSubViews{
    
    UIImageView *leftImageV = [[UIImageView alloc]init];
//    leftImageV.frame = CGRectMake(0, 0, 20, 20);
    leftImageV.backgroundColor = [UIColor greenColor];
    [self addSubview:leftImageV];
    
    [leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10*autoSizeScaleX);
        make.top.equalTo(self.contentView.mas_top).offset(10 *autoSizeScaleY);
        make.width.equalTo(@(20 *autoSizeScaleX));
         make.height.equalTo(@(20 *autoSizeScaleX));
        
    }];
    
    
    UILabel *nameLabel = [[UILabel alloc]init];
    //    leftImageV.frame = CGRectMake(0, 0, 20, 20);
    nameLabel.backgroundColor = [UIColor greenColor];
    [self addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftImageV.mas_right).offset(10*autoSizeScaleX);
        make.top.equalTo(self.contentView.mas_top).offset(10 *autoSizeScaleY);
        make.width.equalTo(@(20 *autoSizeScaleX));
        make.height.equalTo(@(20 *autoSizeScaleX));

        
    }];


}

@end
