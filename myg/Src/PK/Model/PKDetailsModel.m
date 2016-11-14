//
//  PKDetailsModel.m
//  myg
//
//  Created by Apple on 16/11/14.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKDetailsModel.h"
#import "PKDetailsBallListModel.h"
@implementation PKDetailsModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"ball_list":[PKDetailsBallListModel class]};
}
@end
