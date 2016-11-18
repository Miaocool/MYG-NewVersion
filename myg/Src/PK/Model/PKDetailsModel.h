//
//  PKDetailsModel.h
//  myg
//
//  Created by Apple on 16/11/14.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PKDetailsModel : NSObject
//{
//    code = 200;
//    count = "";
//    data =     {
//        "ball_list" =         (
//        );
//        "blue_hasnum" = 6;
//        id = 2;
//        money = 18;
//        nextid = 1;
//        nextqishu = 1;
//        picarr =         (
//                          "http://192.168.1.188/statics/uploads/photo/goods.jpg"
//                          );
//        qishu = 1;
//        "red_hasnum" = 5;
//        sale = 1;
//        "sd_count" = 0;
//        "show_time" = 0;
//        sid = 1;
//        status = 1;
//        tishi = "";
//        title = "\U79fb\U52a8\U5145\U503c\U536130\U5143";
//        type = "\U8fdb\U884c\U4e2d";
//        url = "http://192.168.1.188/app/home/rule_url";
//        waittime = 0;
//        zongrenshu = 18;
//    };
//    msg = "";
//}
/** ball_list */
@property (nonatomic,strong)NSArray *ball_list;

/** picarr */
@property (nonatomic,strong)NSArray *picarr;
/** blue_hasnum */
@property (nonatomic,strong)NSString *blue_hasnum;


/** buy_bluenum */
@property (nonatomic,strong)NSString *buy_bluenum;

/** buy_rednum */
@property (nonatomic,strong)NSString *buy_rednum;
/** id */
@property (nonatomic,strong)NSString *id;
/** money */
@property (nonatomic,strong)NSString *money;
/** nextid */
@property (nonatomic,strong)NSString *nextid;
/** nextqishu */
@property (nonatomic,strong)NSString *nextqishu;
/** qishu */
@property (nonatomic,strong)NSString *qishu;
/** red_hasnum */
@property (nonatomic,strong)NSString *red_hasnum;
/** sale */
@property (nonatomic,strong)NSString *sale;
/** sd_count */
@property (nonatomic,strong)NSString *sd_count;
/** show_time */
@property (nonatomic,strong)NSString *show_time;
/** sid */
@property (nonatomic,strong)NSString *sid;
/** status */
@property (nonatomic,strong)NSString *status;
/** tishi */
@property (nonatomic,strong)NSString *tishi;
/** title */
@property (nonatomic,strong)NSString *title;
/** type */
@property (nonatomic,strong)NSString *type;
/** url */
@property (nonatomic,strong)NSString *url;
/** waittime */
@property (nonatomic,strong)NSString *waittime;
/** zongrenshu */
@property (nonatomic,strong)NSString *zongrenshu;
@end
