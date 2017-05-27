//
//  LOAppDelegate.h
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *appKey = @"48fc5a5d922744de42586c98";
static NSString *channel = @"Publish channel";
static BOOL isProduction = FALSE;

@interface LOAppDelegate : UIResponder <UIApplicationDelegate>

@property(strong,nonatomic) UIWindow *window;

@end
