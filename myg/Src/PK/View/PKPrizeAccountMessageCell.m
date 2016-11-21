//
//  PKPrizeAccountMessageCell.m
//  myg
//
//  Created by Apple on 16/11/21.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPrizeAccountMessageCell.h"


@interface PKPrizeAccountMessageCell ()
@property (weak, nonatomic) IBOutlet UILabel *sortNum;

@property (weak, nonatomic) IBOutlet UILabel *accountLabel;

@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UIButton *gainPasswprd;

@end




@implementation PKPrizeAccountMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}
- (void)setUp{
    
    UIView *backView = [[UIView alloc]initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = backView;
    
    
    
}

@end
