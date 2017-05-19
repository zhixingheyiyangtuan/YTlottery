//
//  LOAppDelegate.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOAppDelegate.h"
#import "LOTabBarViewController.h"

@implementation LOAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    //显示状态栏
    application.statusBarHidden = NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[LOTabBarViewController alloc]init];
    [self.window makeKeyAndVisible];


    return YES;

}

@end
