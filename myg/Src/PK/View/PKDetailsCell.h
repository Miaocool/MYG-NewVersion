//
//  PKDetailsCell.h
//  myg
//
//  Created by Apple on 16/11/4.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKDetailsModel.h"
typedef NS_ENUM(NSUInteger, PKBallType) {
    PKBallTypeRedBall = 0,
    PKBallTypeBlueBall
};

@class PKDetailsCell;
@protocol PKDetailsCellDelegate <NSObject>

- (void)pkDetailsCell:(PKDetailsCell *)pkDetailsCell ballType:(PKBallType)ballType;
- (void)pkDetailsCell:(PKDetailsCell *)pkDetailsCell pastRecordResult:(PKDetailsModel *)ballModel;
- (void)pkDetailsCell:(PKDetailsCell *)pkDetailsCell prictureInfo:(PKDetailsModel *)ballModel;
@end
@interface PKDetailsCell : UITableViewCell
@property (nonatomic,weak)id<PKDetailsCellDelegate>delegate;

/** model */
@property (nonatomic,strong)PKDetailsModel *detail;
@end
