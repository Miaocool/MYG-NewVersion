//
//  NetworkTools.h
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    GET,
    POST
} MYGRequestMethod;
typedef void (^MYGRequestCallBack)(id responseObject, NSError *error);

@interface NetworkTools : AFHTTPSessionManager
+ (instancetype)shareInstance;
- (void)request:(MYGRequestMethod)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters finished:(MYGRequestCallBack)finished;

@end
