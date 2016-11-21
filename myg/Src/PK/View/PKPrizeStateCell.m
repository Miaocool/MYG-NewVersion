//
//  PKPrizeStateCell.m
//  myg
//
//  Created by Apple on 16/11/21.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPrizeStateCell.h"

@interface PKPrizeStateCell ()
@property (weak, nonatomic) IBOutlet UIImageView *stateIMG;
@property (weak, nonatomic) IBOutlet UIView *upLineView;
@property (weak, nonatomic) IBOutlet UIView *downLineView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end


@implementation PKPrizeStateCell

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
