//
//  LOPoetry.m
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOPoetry.h"
#import "FMDatabase.h"
#import "LODBManager.h"

@implementation LOPoetry


+ (NSArray *)poetryListWithKind:(NSString *)kind{
    FMDatabase *database = [LODBManager sharedDatabase];
    //如果数据库语句需要传参 ⬇️
    FMResultSet *resultSet = [database executeQueryWithFormat:@"select * from T_SHI where d_kind = %@", kind];
    NSArray *array = [self resultSetToPoetryList:resultSet];
    
    [database close];
    return array;
}


//把搜索结果FMResultSet类型转换为 包含PoetryModel的数组类型
+ (NSArray *)resultSetToPoetryList:(FMResultSet *)rs{
    
    NSMutableArray *dataArr = [NSMutableArray new];
    
    while ([rs next]) {
        LOPoetry *model = [self new];
        
        model.kind = [rs stringForColumn:@"d_kind"];
        model.author=[rs stringForColumn:@"d_author"];
        model.title=[rs stringForColumn:@"d_title"];
        model.ID = [rs longForColumn:@"d_id"];
        model.shi = [rs stringForColumn:@"d_shi"];
        model.introShi=[rs stringForColumn:@"d_introshi"];
        
        [dataArr addObject:model];
    }
    
    return [dataArr copy];
}


@end
