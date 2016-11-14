//
//  PKAnnounceHeaderView.m
//  myg
//
//  Created by Apple on 16/11/7.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKAnnounceHeaderView.h"

@interface PKAnnounceHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *productIMG;
@property (weak, nonatomic) IBOutlet UIButton *prictureIMGBtn;
@property (weak, nonatomic) IBOutlet UILabel *productState;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *lotteryResult;
@property (weak, nonatomic) IBOutlet UILabel *lotteryNumber;
@property (weak, nonatomic) IBOutlet UIButton *checkCalculateDetailBtn;
@property (weak, nonatomic) IBOutlet UIView *redBallView;
@property (weak, nonatomic) IBOutlet UILabel *selectRedBallCount;
@property (weak, nonatomic) IBOutlet UIView *blueBallView;
@property (weak, nonatomic) IBOutlet UILabel *selectBlueBallCount;
@property (weak, nonatomic) IBOutlet UILabel *successPairCount;
@property (weak, nonatomic) IBOutlet UILabel *failPairCount;
@end
@implementation PKAnnounceHeaderView
/**
 *配对信息 me & all
 */
- (IBAction)allAndMyPairDetailAction:(id)sender {
    
}
- (void)setDetail:(PKDetailsModel *)detail{
    _detail = detail;
    
    [self.productIMG sd_setImageWithURL:[NSURL URLWithString:detail.picarr[0]] placeholderImage:[UIImage imageNamed:DefaultImage]];
    self.productState.text = detail.type;
    self.productName.text = detail.title;
//    self.lotteryResult.text = [NSString stringWithFormat:@""];
    
    
    
    
    
}



@end
