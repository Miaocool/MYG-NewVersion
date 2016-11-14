//
//  PKDetailViewController.h
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKDetailViewController : MaiViewController
@property (nonatomic,assign)BOOL isAlReady;


@property (nonatomic, copy) NSString *idd; //商品id
@property (nonatomic, copy) NSString *zhongjiangID; //中奖人
@property (nonatomic, copy) NSString *sid; //商品id

@property (nonatomic, copy) NSString *qishu; //商品id
@end
