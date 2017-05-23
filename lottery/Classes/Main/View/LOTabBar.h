//
//  LOTabBar.h
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LOTabBar;
@protocol LOTabBarDelegate <NSObject>

@optional
-(void)tabBar:(LOTabBar *)tabBar didSelectButtonFrom:(long)from to:(long)to;


@end

@interface LOTabBar : UIView


@property(nonatomic,strong) UITabBarItem *item;

@property(nonatomic,weak) id<LOTabBarDelegate> delegate;

@end
