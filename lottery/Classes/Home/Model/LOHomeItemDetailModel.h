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




@interface LOHomeLotteryDetailModel : NSObject

/** 中奖注数*/
@property(nonatomic,strong)NSNumber *awardNumber;

/** 每注奖金*/
@property(nonatomic,strong)NSNumber *awardPrice;

/** 奖项*/
@property(nonatomic,copy)NSString *awards;


@end

@interface LOHomeItemDetailTopModel : NSObject


/** 图片*/
@property(nonatomic,copy)NSString *itemImage;

/** 标题*/
@property(nonatomic,copy)NSString *itemName;

/** 内容*/
@property(nonatomic,copy)NSString *itemContent;

@end


