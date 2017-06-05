//
//  LOweChatListCell.m
//  lottery
//
//  Created by 杨湍 on 2017/6/5.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOweChatListCell.h"
#import "UIImageView+WebCache.h"

#define VIEWBORDER 10 *autoSizeScaleX
#define VIEWHEIGHT 60 *autoSizeScaleY
#define VIEWWIDTH 100 *autoSizeScaleX
#define VIEWTOP 10 *autoSizeScaleY
#define CELLNAMEFONT FontWithSize(15)

@interface LOweChatListCell()

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)UILabel *nameLabel;

@end

@implementation LOweChatListCell


/**快速取cell */
+(instancetype)LOCell:(UITableView *)tableView
{
    static NSString *const ID = @"LOweChatListCell";
    LOweChatListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:self forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
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
    
    UIImageView *ImageV = [[UIImageView alloc]init];
    [self addSubview:ImageV];
    self.imageV = ImageV;
    
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = CELLNAMEFONT;
    nameLabel.numberOfLines = 0;
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    
}


-(void)setWeChatModel:(LOWeChatListModel *)weChatModel{

    _weChatModel = weChatModel;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:weChatModel.picUrl] placeholderImage:[UIImage imageNamed:@"AppIcon.png"]];
    self.nameLabel.text = weChatModel.title;


}

-(void)layoutSubviews{

    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-VIEWBORDER);
        make.top.equalTo(self.mas_top).offset(VIEWTOP);
        make.width.equalTo(@(VIEWWIDTH));
        make.height.equalTo(@(VIEWHEIGHT));
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2 * VIEWBORDER);
        make.top.equalTo(self.mas_top).offset(VIEWTOP);
        make.right.equalTo(self.imageV.mas_left).offset(- VIEWBORDER);
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
