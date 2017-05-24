//
//  LOHomeDetailBottomCell.m
//  lottery
//
//  Created by 杨湍 on 2017/5/24.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeDetailBottomCell.h"

#define VIEWBORDER 10 *autoSizeScaleX

#define VIEWWIDTH (SCREEN_WIDTH - 4 *VIEWBORDER)/3
#define VIEWHEIGHT 40 *autoSizeScaleY
#define VIEWTOP 2 *autoSizeScaleY

#define CELLNAMEFONT FontWithSize(15)

@interface LOHomeDetailBottomCell()

@property(nonatomic,strong)UILabel *awardsLabel;
@property(nonatomic,strong)UILabel *awardNumberLabel;
@property(nonatomic,strong)UILabel *awardPriceLabel;

@end

@implementation LOHomeDetailBottomCell

/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView
{
    static NSString *const ID = @"LOHomeDetailBottomCell";
    LOHomeDetailBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:self forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
    
    self.awardsLabel =  [self createLabel];
    self.awardNumberLabel =  [self createLabel];
    self.awardPriceLabel = [self createLabel];
    
}


-(UILabel *)createLabel{
    
    UILabel *label = [[UILabel alloc]init];
    label.layer.borderWidth = 0.5;
    label.layer.borderColor = [SYSTEMCOLOR CGColor];
    label.layer.cornerRadius = 3.0;
    label.font = CELLNAMEFONT;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    return label;
    
}


-(void)setBottomModel:(LOHomeLotteryDetailModel *)bottomModel{
 
    _bottomModel = bottomModel;
    
    self.awardsLabel.text = bottomModel.awards;
    self.awardNumberLabel.text = bottomModel.awardNumber;
    self.awardPriceLabel.text = bottomModel.awardPrice;

}

-(void)setIndex:(NSIndexPath *)index{
    
    if (index.row % 2 == 0) {
        self.awardPriceLabel.backgroundColor = BACKGROUNDCOLOR;
        self.awardsLabel.backgroundColor = BACKGROUNDCOLOR;
        self.awardNumberLabel.backgroundColor = BACKGROUNDCOLOR;
    }



}
-(void)layoutSubviews{
    
    
    [self.awardsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(VIEWBORDER);
        make.top.equalTo(self.mas_top).offset(VIEWTOP);
        make.width.equalTo(@(VIEWWIDTH));
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    [self.awardNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awardsLabel.mas_right).offset(VIEWBORDER);
        make.top.equalTo(self.mas_top).offset(VIEWTOP);
        make.width.equalTo(@(VIEWWIDTH));
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    
    [self.awardPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awardNumberLabel.mas_right).offset(VIEWBORDER);
        make.top.equalTo(self.mas_top).offset(VIEWTOP);
        make.width.equalTo(@(VIEWWIDTH));
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    
}

@end
