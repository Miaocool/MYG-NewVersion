//
//  PKGlobalTool.m
//  myg
//
//  Created by Apple on 16/11/15.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKGlobalTool.h"
static PKGlobalTool *instance = nil;
@implementation PKGlobalTool
+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}
@end
