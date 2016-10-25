//
//  ChanceSurperView.h
//  myg
//
//  Created by Apple on 16/10/20.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListingModel.h"
#import "ShoppingModel.h"
@class ChanceSurperView;
@protocol ChanceSurperViewDelegate <NSObject>

- (void)chanceSurperView:(ChanceSurperView *)chanceSurperView settleModel:(ShoppingModel *)model;

@end


@interface ChanceSurperView : UIView
@property (nonatomic,strong)ShoppingModel *model;
@property (nonatomic,weak)id<ChanceSurperViewDelegate>delegate;
@end
