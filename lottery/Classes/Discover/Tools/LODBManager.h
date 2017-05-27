//
//  LODBManager.h
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface LODBManager : NSObject

//单例模式，返回唯一的数据库对象
+ (FMDatabase *)sharedDatabase;

@end
