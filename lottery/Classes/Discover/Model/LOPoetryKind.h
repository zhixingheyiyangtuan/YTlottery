//
//  LOPoetryKind.h
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOPoetryKind : NSObject


@property(nonatomic,copy) NSString *kind;
@property(nonatomic,assign) long num;
@property(nonatomic,copy) NSString *introKind;
@property(nonatomic,copy) NSString *introKind2;

//删除当前数据
+ (BOOL)removeKind:(NSString *)kindStr;

+ (NSArray *)kinds;


@end
