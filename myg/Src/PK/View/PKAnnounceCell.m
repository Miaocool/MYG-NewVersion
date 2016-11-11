//
//  PKAnnounceCell.m
//  myg
//
//  Created by Apple on 16/11/7.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKAnnounceCell.h"

@interface PKAnnounceCell ()
@property (weak, nonatomic) IBOutlet UIImageView *blueUserIMG;
@property (weak, nonatomic) IBOutlet UILabel *blueUserName;
@property (weak, nonatomic) IBOutlet UILabel *blueUserAddress;
@property (weak, nonatomic) IBOutlet UILabel *pkNumber;
@property (weak, nonatomic) IBOutlet UIImageView *redUserIMG;
@property (weak, nonatomic) IBOutlet UILabel *redUserName;
@property (weak, nonatomic) IBOutlet UILabel *redUserAddress;
@end


@implementation PKAnnounceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpUI];
    
    
    
    
}
- (void)setUpUI{
    UIView *selectBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    selectBackView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = selectBackView;
}

@end
