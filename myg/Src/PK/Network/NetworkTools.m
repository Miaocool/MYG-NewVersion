//
//  NetworkTools.m
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "NetworkTools.h"

static NetworkTools *tools = nil;
@implementation NetworkTools
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15;
        
        
//#define APPHost @"http://www.miyungou.com/?" //sheng
//#define DeveHost @"http://192.168.1.188"
        NSURL *baseURL = [NSURL URLWithString:DeveHost];
        tools = [[self alloc]initWithBaseURL:baseURL sessionConfiguration:config];
    });
    return tools;
}

- (void)request:(MYGRequestMethod)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters finished:(MYGRequestCallBack)finished{
    id success = ^(NSURLSessionDataTask *task, id responseObject) {
        if (finished) {
            finished(responseObject,nil);
        }
    };
    id failure = ^(NSURLSessionDataTask *task, NSError *error) {
        if (finished) {
            finished(nil,error);
        }
    };
    if (method == GET) {
        [self GET:URLString parameters:parameters success:success failure:failure];
    }
    if (method == POST) {
        [self POST:URLString parameters:parameters success:success failure:failure];
    }
}
@end
