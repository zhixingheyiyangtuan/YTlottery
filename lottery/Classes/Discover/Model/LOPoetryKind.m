//
//  LOPoetryKind.m
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOPoetryKind.h"
#import "FMDatabase.h"
#import "LODBManager.h"

@implementation LOPoetryKind


+ (NSArray *)kinds {
    //从数据库中获取t_kind表中所有数据
    FMDatabase *db = [LODBManager sharedDatabase];
    FMResultSet *rs = [db executeQuery:@"select * from T_KIND"];
    
    NSMutableArray *dataArr = [NSMutableArray new];
    
    while ([rs next]) {
        LOPoetryKind *model = [self new];
        model.kind = [rs stringForColumn:@"D_KIND"];
        model.num = [rs longForColumn:@"D_NUM"];
        model.introKind = [rs stringForColumn:@"D_INTROKIND"];
        model.introKind2 = [rs stringForColumn:@"D_INTROKIND2"];
        [dataArr addObject:model];
    }
    
    //释放掉搜索出来的内容
    [db closeOpenResultSets];
    [db close];
    
    return [dataArr copy];
}


@end
