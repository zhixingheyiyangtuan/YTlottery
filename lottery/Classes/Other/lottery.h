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
#define LOColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#endif /* lottery_h */
