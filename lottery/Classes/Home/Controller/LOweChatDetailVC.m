//
//  LOweChatDetailVC.m
//  lottery
//
//  Created by 杨湍 on 2017/6/5.
//  Copyright © 2017年 杨湍. All rights reserved.
//

#import "LOweChatDetailVC.h"

@interface LOweChatDetailVC ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;

@end

@implementation LOweChatDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView * webView = [[UIWebView alloc]init];
    webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    NSURL* url = [NSURL URLWithString:self.weChatModel.url];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [webView loadRequest:request];//加载
    
    
    
}

#pragma -mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    [self showLoadingViewWithMessage:@"正在加载。。。"];
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{

    [self showLoadingViewWithMessage:@"正在加载。。。"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideLoadingView];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

    [self showErrorMessage:@"加载失败"];

}
@end


