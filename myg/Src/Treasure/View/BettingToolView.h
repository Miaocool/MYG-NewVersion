//
//  BettingToolView.h
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BettingToolView;
@protocol BettingToolViewDelegate <NSObject>

- (void)bettingToolView:(BettingToolView *)bettingToolView index:(NSInteger )index;

@end

@interface BettingToolView : UIView
@property (nonatomic,weak)id<BettingToolViewDelegate>delegate;
- (void)setTitleWithSourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;
@end
