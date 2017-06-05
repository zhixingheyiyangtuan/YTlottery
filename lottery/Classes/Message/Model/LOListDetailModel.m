//
//  LOListDetailModel.m
//  lottery
//
//  Created by 杨湍 on 2017/6/2.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOListDetailModel.h"
@class LOListDetailDataModel;

@implementation LOListDetailModel

- (NSDictionary *)objectClassInArray
{
    return @{@"data" : [LOListDetailDataModel class]};
}



@end

@implementation LOListDetailDataModel



@end
