//
//  LOListDetailCell.m
//  lottery
//
//  Created by 杨湍 on 2017/6/2.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOListDetailCell.h"

#define VIEWBORDER 10 *autoSizeScaleX
#define VIEWHEIGHT 30 *autoSizeScaleY
#define VIEWTOP 0 *autoSizeScaleY
#define CELLNAMEFONT FontWithSize(15)

@interface LOListDetailCell()

@property(nonatomic,strong)UILabel *expectLabel;
@property(nonatomic,strong)UILabel *opentimeLabel;
@property(nonatomic,strong)UILabel *opencodeLabel;

@end

@implementation LOListDetailCell

/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView
{
    static NSString *const ID = @"LOListDetailCell";
    LOListDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:self forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
    }
   
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.separatorInset = 
    
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
    
    self.expectLabel =  [self createLabel];
    self.opentimeLabel =  [self createLabel];
    self.opencodeLabel = [self createLabel];
    
}

-(void)setDataModel:(LOListDetailDataModel *)dataModel{
    _dataModel = dataModel;

    
    self.expectLabel.text = [NSString stringWithFormat:@"第%@期",dataModel.expect];
    self.opentimeLabel.text = [NSString stringWithFormat:@"开奖时间：%@", [dataModel.opentime substringFromIndex:5]];
    
    self.opencodeLabel.text = [NSString stringWithFormat:@"开奖号码：%@",dataModel.opencode];
    
}


-(void)setIndex:(NSIndexPath *)index{
    
    if (index.row % 2 == 0) {
        self.backgroundColor = BACKGROUNDCOLOR;
    }
    
}


-(UILabel *)createLabel{
    
    UILabel *label = [[UILabel alloc]init];
//    label.layer.borderWidth = 0.5;
//    label.layer.borderColor = [SYSTEMCOLOR CGColor];
//    label.layer.cornerRadius = 3.0;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = CELLNAMEFONT;
    label.textColor = SYSTEMCOLOR;
    
    [self addSubview:label];
    
    return label;
    
}

-(void)layoutSubviews{
    
    self.expectLabel.font = FontWithSize(20);
    
    [self.expectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(VIEWBORDER);
        make.top.equalTo(self.mas_top).offset(VIEWTOP);
        make.right.equalTo(self.mas_right).offset(- VIEWBORDER);
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    [self.opentimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(VIEWBORDER);
        make.top.equalTo(self.expectLabel.mas_bottom).offset(VIEWTOP);
        make.right.equalTo(self.mas_right).offset(- VIEWBORDER);
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    
    [self.opencodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(VIEWBORDER);
        make.top.equalTo(self.opentimeLabel.mas_bottom).offset(VIEWTOP);
        make.right.equalTo(self.mas_right).offset(- VIEWBORDER);
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    
    CGContextFillRect(context, rect);
    
    //上分割线，
    //CGContextSetStrokeColorWithColor(context, COLORWHITE.CGColor);
    //CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 1));
    
    //下分割线
    CGContextSetStrokeColorWithColor(context,SYSTEMCOLOR.CGColor);
    CGContextStrokeRect(context,CGRectMake(10 *autoSizeScaleX, rect.size.height-0.1 *autoSizeScaleY, SCREEN_WIDTH-20 *autoSizeScaleX,0.1 *autoSizeScaleY));
}

@end
