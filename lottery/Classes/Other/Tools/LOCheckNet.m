//
//  LOCheckNet.m
//  lottery
//
//  Created by 杨湍 on 2017/6/8.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOCheckNet.h"

#import <WebKit/WebKit.h>
#import "AFNHttpTools.h"
//#import "RootViewController.h"


@implementation LOCheckNet


+ (LOCheckNet *)shareCheckNet{
    static LOCheckNet *cNet ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cNet = [[LOCheckNet alloc]init];
    });
    return cNet;
}
- (void)checkCurrentNet{
    [self startAction];
}

- (void)startAction{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:CHECKNET parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *tempD = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"==%@",tempD);
        NSString *str =[tempD valueForKey:@"wapurl"];
        if ([str containsString:@""]) {
            [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
        __block LOCheckNet *selfN = self;
        //        selfN.conecting([NSURL URLWithString:@"http://www.baidu.com"]);
        if ([[tempD valueForKey:@"desc"] isEqualToString:@"成功返回数据"] && ![str  isEqual:@""]) {
            selfN.conecting([NSURL URLWithString:[tempD valueForKey:@"wapurl"]]);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        NSLog(@"err -- %@",error.userInfo);
    }];
}


@end
