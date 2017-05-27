//
//  LOTabBarViewController.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOTabBarViewController.h"
#import "LOHomeVC.h"
#import "LOMessageVC.h"
#import "LOMeViewController.h"
#import "LODiscoverVC.h"
#import "LONavigationController.h"
#import "LOTabBar.h"


@interface LOTabBarViewController ()<LOTabBarDelegate>

@property(nonatomic,weak)LOTabBar *customTabBar;
@end

@implementation LOTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化tabbar
    [self setupTabbar];
    //初始化所有的字控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}



/**
 * 初始化tabbar
 */

-(void)setupTabbar{
    LOTabBar *customTabBar = [[LOTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    customTabBar.delegate = self;
    self.customTabBar = customTabBar;



}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */

-(void)tabBar:(LOTabBar *)tabBar didSelectButtonFrom:(long)from to:(long)to{

    self.selectedIndex = to;
}


-(void)setupAllChildViewControllers{
    
    // 1.首页
    LOHomeVC *homeVC = [[LOHomeVC alloc] init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];

    
    // 2.消息
    LOMessageVC *messageVC = [[LOMessageVC alloc] init];
    [self setupChildViewController:messageVC title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    // 3.广场
    LODiscoverVC *discoverVC = [[LODiscoverVC alloc] init];
    [self setupChildViewController:discoverVC title:@"诗词" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    // 4.我
    LOMeViewController *meVC = [[LOMeViewController alloc] init];
    [self setupChildViewController:meVC title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];




}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
  
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    // 2.包装一个导航控制器
    LONavigationController *nav = [[LONavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
//    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
    
    self.customTabBar.item = childVc.tabBarItem;
    
    
}

@end
