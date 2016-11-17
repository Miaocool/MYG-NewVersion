//
//  PKAnnounceHeaderView.h
//  myg
//
//  Created by Apple on 16/11/7.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKDetailsModel.h"
@class PKAnnounceHeaderView;

@protocol PKAnnounceHeaderViewDelegate <NSObject>

- (void)pkAnnounceHeaderView:(PKAnnounceHeaderView *)pkAnnounceHeaderView button:(UIButton *)button;

@end
@interface PKAnnounceHeaderView : UIView
/** model */
@property (nonatomic,strong)PKDetailsModel *detail;
@property (nonatomic,weak)id<PKAnnounceHeaderViewDelegate>delegate;

/** 配对成功 */
@property (nonatomic,strong)NSString *pkokNum;
/** 配对失败 */
@property (nonatomic,strong)NSString *pkfailNum;
@end
