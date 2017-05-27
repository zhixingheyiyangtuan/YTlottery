//
//  LOPoetry.h
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOPoetry : NSObject


@property(nonatomic,copy) NSString *kind;
@property(nonatomic,copy) NSString *shi;
@property(nonatomic,copy) NSString *introShi;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,assign) long ID;
@property(nonatomic,copy) NSString *author;

+ (NSArray *)poetryListWithKind:(NSString *)kind;



@end
