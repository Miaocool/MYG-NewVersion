//
//  PKPrizeMessageCell.m
//  myg
//
//  Created by Apple on 16/11/21.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPrizeMessageCell.h"


@interface PKPrizeMessageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *produceIMG;
@property (weak, nonatomic) IBOutlet UILabel *produceName;
@property (weak, nonatomic) IBOutlet UILabel *peopleTime;
@property (weak, nonatomic) IBOutlet UILabel *luckNum;
@property (weak, nonatomic) IBOutlet UILabel *joinPeopleTime;
@property (weak, nonatomic) IBOutlet UILabel *prizeTime;

@end


@implementation PKPrizeMessageCell

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
