//
//  LOListDetailModel.h
//  lottery
//
//  Created by 杨湍 on 2017/6/2.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOListDetailModel : NSObject
/** 彩票名称 */
@property(nonatomic,copy) NSString *code;

/** 彩票数据 */
@property(nonatomic,copy) NSArray *data;

/** 返回条数 */
@property(nonatomic,assign) long rows;

/** 彩票信息 */
@property(nonatomic,copy) NSString *info;

@end


@interface LOListDetailDataModel : NSObject

/** 中奖号码 */
@property(nonatomic,copy) NSString *opencode;

/** 彩票期数 */
@property(nonatomic,copy) NSString *expect;

/** 开奖时间 */
@property(nonatomic,copy) NSString *opentime;

/** 开奖时间戳 */
@property(nonatomic,assign) long opentimestamp;

@end

