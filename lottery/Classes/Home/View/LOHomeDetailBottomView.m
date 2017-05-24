//
//  LOHomeDetailBottomView.m
//  lottery
//
//  Created by 杨湍 on 2017/5/24.
//  Copyright © 2017年 杨湍. All rights reserved.
//



#import "LOHomeDetailBottomView.h"

@interface LOHomeDetailBottomView()

@property(nonatomic,strong)UILabel *awardsLabel;
@property(nonatomic,strong)UILabel *awardNumberLabel;
@property(nonatomic,strong)UILabel *awardPriceLabel;

@end

@implementation LOHomeDetailBottomView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self createUI];
        
    }

    return self;

}

-(void)createUI{

    self.awardsLabel =  [self createLabelWithTitle:@"奖项"];
    self.awardNumberLabel =  [self createLabelWithTitle: @"中奖注数"];
    self.awardPriceLabel =  [self createLabelWithTitle:@"每注奖金"];
    
}

-(UILabel *)createLabelWithTitle:(NSString *)title{

    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = BACKGROUNDCOLOR;
    [self addSubview:label];
    
    return label;
    
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
