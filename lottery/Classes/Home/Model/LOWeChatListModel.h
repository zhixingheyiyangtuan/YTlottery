//
//  LOWeChatListModel.h
//  lottery
//
//  Created by 杨湍 on 2017/6/5.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LOWeChatListModel : NSObject

/** 创建时间*/
@property(nonatomic,strong)NSString *ctime;

/** 标题*/
@property(nonatomic,strong)NSString *title;

/** 描述*/
@property(nonatomic,strong)NSString *Description;

/** 文章链接*/
@property(nonatomic,strong)NSString *url;

/** 图片链接*/
@property(nonatomic,strong)NSString *picUrl;
@end
