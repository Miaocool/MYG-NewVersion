//
//  PKSettleView.h
//  myg
//
//  Created by 李艳楠 on 16/10/29.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PKSettleView;
@class ShoppingModel;
@protocol PKSettleViewDelegate <NSObject>

- (void)pkSettleView:(PKSettleView *)pkSettleView shopModel:(ShoppingModel *)shopModel;

@end



@interface PKSettleView : UIView
@property (weak,nonatomic)id<PKSettleViewDelegate>delegate;
@end
