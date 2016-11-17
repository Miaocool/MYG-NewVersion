//
//  PKUserPairModel.h
//  myg
//
//  Created by Apple on 16/11/17.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKUser.h"
@interface PKUserPairModel : NSObject
//{"state":"1",
//"pkok":"1",
//"code":"1",
//"red":{
//    "uid":"11788",
//    "username":"不中再来一次",
//    "ip":"浙江省杭州市,125.122.34.116",
//    "state":"1"
//},
//"blue":{
//    "uid":"11788",
//    "username":"不中再来一次",
//    "ip":"浙江省杭州市,125.122.34.116",
//    "state":""
//}
//}
/** state */
@property (nonatomic,strong)NSString *state;
/** pkok */
@property (nonatomic,strong)NSString *pkok;
/** code */
@property (nonatomic,strong)NSString *code;
/** red */
@property (nonatomic,strong)PKUser *red;
/** blue */
@property (nonatomic,strong)PKUser *blue;

@end
