//
//  LOCheckNet.h
//  lottery
//
//  Created by 杨湍 on 2017/6/8.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOCheckNet : NSObject

@property(nonatomic,copy)void(^conecting)(NSURL *url);
+ (LOCheckNet *)shareCheckNet;
- (void)checkCurrentNet;

@end
