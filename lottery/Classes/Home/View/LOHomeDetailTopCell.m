//
//  LOHomeDetailTopCell.m
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeDetailTopCell.h"

#define CELLTOP 10 *autoSizeScaleY
#define CELLBORDER 10 *autoSizeScaleX
#define CELLNAMEFONT FontWithSize(16)


@interface LOHomeDetailTopCell()

@property(nonatomic,strong)UIImageView *leftImageV;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *contentLabel;


@end


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
    
    UIImageView *leftImageV = [[UIImageView alloc]init];
    [self addSubview:leftImageV];
    self.leftImageV = leftImageV;
    

    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = CELLNAMEFONT;
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.font = CELLNAMEFONT;
    contentLabel.textColor = SYSTEMCOLOR;
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
}


-(void)setTopModel:(LOHomeItemDetailTopModel *)topModel{

    _topModel = topModel;
    //1.图片
    self.leftImageV.image = [UIImage imageNamed:topModel.itemImage];
    self.leftImageV.frame = CGRectMake(10 *autoSizeScaleX, 7*autoSizeScaleY, 30 *autoSizeScaleX, 30 *autoSizeScaleX);
    
    //2.标题
    CGFloat nameLabelX = CGRectGetMaxX(_leftImageV.frame) + CELLBORDER;
    CGFloat nameLabelY = CELLTOP;
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGSize nameLabelSize = [topModel.itemName boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:CELLNAMEFONT}  context:nil].size;
     self.nameLabel.frame = (CGRect){{nameLabelX, nameLabelY}, nameLabelSize};
    
    CGPoint nameLabelcenter = self.nameLabel.center;
    nameLabelcenter.y = self.contentView.center.y;
    self.nameLabel.center = nameLabelcenter;
    self.nameLabel.text = topModel.itemName;
    
//    //2.内容
    CGFloat contentLabelX = CGRectGetMaxX(_nameLabel.frame) + 4 * CELLBORDER;
    CGFloat contentLabelY = CELLTOP;
    CGSize contentLabelSize = [topModel.itemContent boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:CELLNAMEFONT}  context:nil].size;
    self.contentLabel.frame = (CGRect){{contentLabelX, contentLabelY}, contentLabelSize};
    
    CGPoint contentLabelcenter = self.contentLabel.center;
    contentLabelcenter.y = self.contentView.center.y;
    self.contentLabel.center = contentLabelcenter;
    self.contentLabel.text = topModel.itemContent;

    
    




}


@end
