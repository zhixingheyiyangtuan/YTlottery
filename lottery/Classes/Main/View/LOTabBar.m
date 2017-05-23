//
//  LOTabBar.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOTabBar.h"
#import "LOTabBarButton.h"

@interface LOTabBar()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) LOTabBarButton *selectedButton;
@end

@implementation LOTabBar

-(NSMutableArray *)tabBarButtons{

    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }

    return _tabBarButtons;
}

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        if (!iOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }

        
    }
   return self;

}

-(void)setItem:(UITabBarItem *)item{
    
    _item = item;

    // 1.创建按钮
    LOTabBarButton *button = [[LOTabBarButton alloc] init];
    [self addSubview:button];
    // 添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }


}


-(void)buttonClick:(LOTabBarButton *)button{
    
   // 1.通知代理
    if (_delegate && [_delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [_delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;


}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整加号按钮的位置
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
   
    
    // 按钮的frame数据
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.tabBarButtons.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        // 1.取出按钮
        LOTabBarButton *button = self.tabBarButtons[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
       
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}

@end
