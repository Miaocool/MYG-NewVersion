//
//  PKListCell.m
//  myg
//
//  Created by 李艳楠 on 16/10/29.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKListCell.h"
#import "PKListModel.h"
@interface PKListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *listProduceIMG;
@property (weak, nonatomic) IBOutlet UILabel *listProduceName;
@property (weak, nonatomic) IBOutlet UILabel *listProduceNumber;
@property (weak, nonatomic) IBOutlet UIButton *listPKBtn;

@end


@implementation PKListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpUI];
    
}
- (void)setUpUI{
    
    [self.listPKBtn addTarget:self action:@selector(pkAction) forControlEvents:UIControlEventTouchUpInside];
    UIView *selectView = [[UIView alloc]initWithFrame:self.bounds];
    selectView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = selectView;
    
}
- (void)pkAction{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pkListCell:listModel:)]) {
        [self.delegate pkListCell:self listModel:self.listModel];
    }
}
- (void)setListModel:(PKListModel *)listModel{
    _listModel = listModel;
    //赋值
}

@end
