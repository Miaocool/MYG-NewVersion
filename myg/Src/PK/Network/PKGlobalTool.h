//
//  PKGlobalTool.h
//  myg
//
//  Created by Apple on 16/11/15.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKPayModel.h"
@interface PKGlobalTool : NSObject

+ (instancetype)shareInstance;

@property (nonatomic,assign)BOOL isWhetherPKPay;
@property (nonatomic,strong)PKPayModel *payModel;
@property (nonatomic,strong)NSString *ballType;
@property (nonatomic,strong)NSString *ballMoney;
@property (nonatomic,strong)NSString *sid;
@end
