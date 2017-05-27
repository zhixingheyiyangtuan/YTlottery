//
//  LODBManager.m
//  lottery
//
//  Created by 杨湍 on 2017/5/27.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LODBManager.h"

@implementation LODBManager

+(FMDatabase *)sharedDatabase{

    static FMDatabase *database = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //数据库对象初始化，需要数据库路径
        //        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        //        NSString *databasePath  = [documentsPath stringByAppendingPathComponent:@"sqlite.db"];
        
        //        NSString *path = [[NSBundle mainBundle] pathForResource:@"Poetry" ofType:@"bundle"];
        //        NSString *databasePath = [path stringByAppendingPathComponent:@"sqlite.db"];
        //
        //        database = [FMDatabase databaseWithPath:databasePath];
        
        
        //拼接拷贝的路径(/Documents/sqlite.db)
        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *copyDBPath = [documentsPath stringByAppendingPathComponent:@"sqlite.db"];
        
        //获取数据文件的路径
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Poetry" ofType:@"bundle"];
        //拼接数据库文件的路径
        NSString *databaseFilePath = [bundlePath stringByAppendingPathComponent:@"sqlite.db"];
        NSError *error = nil;
        if (![[NSFileManager defaultManager] fileExistsAtPath:copyDBPath]) {
            [[NSFileManager defaultManager] copyItemAtPath:databaseFilePath toPath:copyDBPath error:&error];
        }
        
        if (!error) {
            //初始化database对象
            database = [FMDatabase databaseWithPath:copyDBPath];
        } else {
            NSLog(@"拷贝失败:%@", error.userInfo);
        }
    });

    //在使用对象之前，要打开数据库。
    [database open];
    return database;

}

@end
