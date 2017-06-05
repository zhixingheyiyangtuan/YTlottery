//
//  LOWeChatListModel.m
//  lottery
//
//  Created by 杨湍 on 2017/6/5.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOWeChatListModel.h"

@implementation LOWeChatListModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id",
             @"Description" : @"description"
             };
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    
//    //手动处理description
//    if ([key isEqualToString: @"description"]) {
//        
//        _desc = value;
//    }else{
//        
//        //调用父类方法，保证其他属性正常加载
//        [super setValue:value forKey:key];
//    }
//}

@end
