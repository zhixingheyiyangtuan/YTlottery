//
//  AFNHttpTools.h
//  DDViedo
//
//  Created by 赵 冰冰 on 15/3/11.
//  Copyright (c) 2015年 赵 冰冰. All rights reserved.
//
typedef void (^RequestSuccessed) (NSDictionary * dict);

typedef void (^RequestFailed) (NSError * err);

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFNHttpTools : NSObject

///get方法
+ (void)getDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed;


@end
