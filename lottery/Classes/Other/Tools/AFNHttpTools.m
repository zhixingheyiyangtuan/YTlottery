//
//  AFNHttpTools.m
//  DDViedo
//
//  Created by 赵 冰冰 on 15/3/11.
//  Copyright (c) 2015年 赵 冰冰. All rights reserved.
//

#import "AFNHttpTools.h"
//
//#import "AFHTTPRequestOperationManager.h"




@implementation AFNHttpTools


+ (void)getDataWithUrl:(NSString *)url
         andParameters:(id)parameters
             successed:(RequestSuccessed)successed
                failed:(RequestFailed)failed
{
   AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html",@"text/json",nil];
    
    
//    NSString * str = [url substringFromIndex:url.length - 1];
//    if([str isEqualToString:@"/"])
//    {
//        url = [url substringToIndex:url.length - 1];
//    }
//    NSString * escapedUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    
//    NSString * timeString = [TimeTool OSTime];
//    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
//    [paramDic setObject:timeString forKey:@"timestamp"];
//    [paramDic setObject:[[NSString stringWithFormat:@"%@%@",timeString,SECU_KEY] sha1]forKey:@"signature"];
//    
//    NSString * newUrl = [NEW_URL_BASE stringByAppendingString:escapedUrl];
    //NSLog(@"get请求url为 = %@",escapedUrl);
    
    NSLog(@"上送url=%@",url);
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    NSLog(@"上送参数=%@",parameters);
    [manager GET:url parameters:paramDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       successed(responseObject);
    NSLog(@"返回参数=%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
    
    
    
}




@end
