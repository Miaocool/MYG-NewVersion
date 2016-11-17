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

@property (weak, nonatomic) IBOutlet UIImageView *blueHead;

@property (weak, nonatomic) IBOutlet UIImageView *redHead;

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
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)setUser:(PKUserPairModel *)user{
    _user = user;
    
    
    [self.blueUserIMG sd_setImageWithURL:[NSURL URLWithString:user.blue.thumb] placeholderImage:[UIImage imageNamed:nil]];
    self.blueUserName.text = user.blue.username;
    NSArray *stringArr1 = [user.blue.ip componentsSeparatedByString:@","];
    self.blueUserAddress.text = [stringArr1 firstObject];
    
    self.pkNumber.text = [NSString stringWithFormat:@"PK编号 : %@",user.code];
    
    
    [self.redUserIMG sd_setImageWithURL:[NSURL URLWithString:user.red.thumb] placeholderImage:[UIImage imageNamed:nil]];
    self.redUserName.text = user.red.username;
    NSArray *stringArr2 = [user.blue.ip componentsSeparatedByString:@","];
    self.redUserAddress.text = [stringArr2 firstObject];
}
@end
