//
//  UIButton+touch.h
//  QHealthForDoctor
//
//  Created by 李志良 on 2017/4/26.
//  Copyright © 2017年 李 志良. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval .7// 默认间隔时间
@interface UIButton (touch)
/**
 *  设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval timeInterVal;
@end
