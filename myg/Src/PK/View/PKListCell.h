//
//  PKListCell.h
//  myg
//
//  Created by 李艳楠 on 16/10/29.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PKListCell;
@class PKListModel;
@protocol PKListCellDelegate <NSObject>

- (void)pkListCell:(PKListCell *)pkListCell listModel:(PKListModel *)listModel;

@end


@interface PKListCell : UITableViewCell
@property (nonatomic,strong)PKListModel *listModel;
@property (weak,nonatomic)id<PKListCellDelegate>delegate;
@end
