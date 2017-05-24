//
//  LOHomeDetailSelectView.m
//  lottery
//
//  Created by 杨湍 on 2017/5/24.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOHomeDetailSelectView.h"

@interface LOHomeDetailSelectView()

@property (nonatomic,strong)UIButton *nextBtn;
@property (nonatomic,strong)UIButton *PreviousBtn;

@end

@implementation LOHomeDetailSelectView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        
    }
    
    return self;
    
}

-(void)createUI{
    
    self.backgroundColor = [UIColor greenColor];
    
    self.PreviousBtn =  [self createButtonWithTitle:@"上一期" WithTag:PreviousTag];
    self.nextBtn =  [self createButtonWithTitle:@"下一期" WithTag:NextTag];

}


-(UIButton *)createButtonWithTitle:(NSString *)title WithTag:(NSInteger)tag {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:0];
    button.tag = tag;
    button.backgroundColor = BACKGROUNDCOLOR;
    [button addTarget:self action:@selector(buttonCilck:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    return button;
    
}

-(void)buttonCilck:(UIButton *)btn{

    if (_delegate && [_delegate respondsToSelector:@selector(LOHomeDetailSelectViewButtonCilckWithButton:)]) {
        [_delegate LOHomeDetailSelectViewButtonCilckWithButton:btn];
        
}
}

-(void)layoutSubviews{
    
    self.PreviousBtn.backgroundColor = SYSTEMCOLOR;
    [self.PreviousBtn setTitleColor:BACKGROUNDCOLOR forState:0];
    [self.PreviousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(@(SCREEN_WIDTH/2));
        make.height.equalTo(@(BUTTONHEIGHT));
        
    }];
    
    self.nextBtn.backgroundColor = BACKGROUNDCOLOR;
    [self.nextBtn setTitleColor:SYSTEMCOLOR forState:0];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.PreviousBtn.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(@(SCREEN_WIDTH/2));
        make.height.equalTo(@(BUTTONHEIGHT));

        
    }];
    
    
}


@end
