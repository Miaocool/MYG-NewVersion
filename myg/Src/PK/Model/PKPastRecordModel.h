//
//  PKPastRecordModel.h
//  myg
//
//  Created by Apple on 16/11/7.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PKPastRecordModel : NSObject
//{
//    "ball_type" = 0;
//    id = 10;
//    sendnum = 40;
//    "show_time" = "2016-11-07 11:38:19";
//}

/** ball_type */
@property (nonatomic,strong)NSString *ball_type;

/** id */
@property (nonatomic,strong)NSString *id;

/** sendnum */
@property (nonatomic,strong)NSString *sendnum;

/** show_time */
@property (nonatomic,strong)NSString *show_time;
@end
