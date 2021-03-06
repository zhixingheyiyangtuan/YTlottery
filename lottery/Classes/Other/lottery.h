//
//  lottery.h
//  lottery
//
//  Created by 杨湍 on 2017/5/19.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#ifndef lottery_h
#define lottery_h

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色

#define LOColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//LOColor(248, 121, 34, 1)
#define SYSTEMCOLOR LOColor(156, 137, 111, 1)
#define BACKGROUNDCOLOR LOColor(240, 240, 240, 1)


// 3.屏幕大小适配
#define autoSizeScaleX  (SCREEN_WIDTH>320?SCREEN_WIDTH/320:1)
#define autoSizeScaleY  (SCREEN_HEIGHT>568?SCREEN_HEIGHT/568:1)
// 4.屏幕宽高
#define SCREEN_HEIGHT      [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH       [[UIScreen mainScreen] bounds].size.width

// 5.状态栏颜色
#define  STATUS_BAR_COLOR LOColor(66, 98, 126, 1)
// 6.导航栏颜色
#define  NAVI_BAR_COLOR LOColor (106, 137, 165, 1)


// 7.字体大小
#define FontWithSize(size)  [UIFont systemFontOfSize:size]

// 8.请求
#define lotteryRequestHeader          @"http://apicloud.mob.com/lottery/query?key=1cfe8e5baeca0"
// 8.请求
#define lotteryListDetail          @"http://f.apiplus.net/"


#define weichatListHeader             @"https://api.tianapi.com/wxnew/?"

//#define CHECKNET                      @"http://appmgr.jwoquxoc.com/frontApi/getAboutUs?appid=com.lotteryTuan.cn"

#define CHECKNET                      @"http://appmgr.jwoquxoc.com/frontApi/getAboutUs?appid=jiuwcom240"

#endif /* lottery_h */
