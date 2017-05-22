//
//  LOHomeItemDetailModel.h
//  lottery
//
//  Created by 杨湍 on 2017/5/22.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOHomeItemDetailModel : NSObject
/** 期数*/
@property(nonatomic,copy)NSString *period;

/** 开奖时间*/
@property(nonatomic,copy)NSString *awardDateTime;

/** 彩票名称*/
@property(nonatomic,copy)NSString *name;

/** 奖池金额*/
@property(nonatomic,strong)NSString *pool;

/** 本期销售*/
@property(nonatomic,strong)NSString *sales;

/** 开奖号码*/
@property(nonatomic,strong)NSArray *lotteryNumber;

/** 开奖详情*/
@property(nonatomic,strong)NSArray *lotteryDetails;

@end


//{
//    awardNumber = 8;
//    awardPrice = 7035961;
//    awards = "\U4e00\U7b49\U5956";
//},

@interface LOHomeLotteryDetailModel : NSObject

/** 中奖注数*/
@property(nonatomic,strong)NSNumber *awardNumber;

/** 每注奖金*/
@property(nonatomic,strong)NSNumber *awardPrice;

/** 奖项*/
@property(nonatomic,copy)NSString *awards;


@end


