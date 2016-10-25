//
//  TheWiningCell.h
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@class TheWiningCell;

@protocol TheWiningCellDelegate <NSObject>

- (void)theWiningCell:(TheWiningCell *)theWiningCell button:(UIButton *)button;

@end

@interface TheWiningCell : UITableViewCell
@property (nonatomic, strong) GoodsModel *goodsModel;
@end
