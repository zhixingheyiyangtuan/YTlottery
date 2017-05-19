//
//  LOTabBar.m
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOTabBar.h"

@implementation LOTabBar

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        if (!iOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }

        
    }
   return self;

}


@end
