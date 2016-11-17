//
//  PKUser.h
//  myg
//
//  Created by Apple on 16/11/17.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PKUser : NSObject
//{
    //    "uid":"11788",
    //    "username":"不中再来一次",
    //    "ip":"浙江省杭州市,125.122.34.116",
    //    "state":"1"
    //}

/** uid */
@property (nonatomic,strong)NSString *uid;
/** username */
@property (nonatomic,strong)NSString *username;
/** ip */
@property (nonatomic,strong)NSString *ip;
/** state */
@property (nonatomic,strong)NSString *state;
/** thumb */
@property (nonatomic,strong)NSString *thumb;
@end
