//
//  PKPastRecordCell.m
//  myg
//
//  Created by Apple on 16/11/7.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPastRecordCell.h"
#import "PKPastRecordModel.h"

@interface PKPastRecordCell ()
@property (weak, nonatomic) IBOutlet UILabel *stageNum;
@property (weak, nonatomic) IBOutlet UIImageView *ballTypeIMG;
@property (weak, nonatomic) IBOutlet UILabel *pkSuccess;
@end

@implementation PKPastRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpUI];
    
}
- (void)setUpUI{
    UIView *selectBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    selectBackView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = selectBackView;
}

- (void)setPastRecordModel:(PKPastRecordModel *)pastRecordModel{
    _pastRecordModel = pastRecordModel;
    
    self.stageNum.text = [NSString stringWithFormat:@"%@期",pastRecordModel.id];
    if ([pastRecordModel.ball_type isEqualToString:@"0"]) {
        self.ballTypeIMG.image = [UIImage imageNamed:@"dahongqiu"];
    }else{
        self.ballTypeIMG.image = [UIImage imageNamed:@"dalanqiu"];
    }
    
    NSInteger successNum = [pastRecordModel.sendnum integerValue] / 2;
    self.pkSuccess.text = [NSString stringWithFormat:@"PK成功(%zd/%zd)",successNum,successNum];
}


@end
