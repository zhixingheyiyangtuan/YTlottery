//
//  LONavigationController.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LONavigationController.h"

@interface LONavigationController ()

@end

@implementation LONavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationBar setBarTintColor:SYSTEMCOLOR];
    
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"背景"] forBarMetrics:UIBarMetricsDefault];
    [[UITableViewCell appearance] setBackgroundColor:[UIColor clearColor]];
    [[UITableView appearance] setSeparatorColor:LOColor(156, 137, 111, 1)];
    [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景"]];
    
    
    [[UINavigationBar appearance] setTintColor:LOColor(114, 103, 84, 1)];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: LOColor(83, 68, 48, 1), NSFontAttributeName: [UIFont systemFontOfSize:22]}];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}



@end
