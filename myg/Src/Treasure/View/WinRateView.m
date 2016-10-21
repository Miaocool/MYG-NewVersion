//
//  WinRateView.m
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "WinRateView.h"

@interface WinRateView ()
@property (weak, nonatomic) IBOutlet UIButton *subtBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *rateText;
@property (weak, nonatomic) IBOutlet UIButton *fisrtRateBtn;
@property (weak, nonatomic) IBOutlet UIButton *secendRateBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdRateBtn;
@property (weak, nonatomic) IBOutlet UIButton *tailRateBtn;
@property (weak, nonatomic) IBOutlet UILabel *sumRate;
@property (weak, nonatomic) IBOutlet UIButton *partakeRateBtn;

@end

@implementation WinRateView

- (IBAction)firstRateAction:(id)sender {
    
}
- (IBAction)secendRateAction:(id)sender {
    
}
- (IBAction)thirdRateAction:(id)sender {
    
}
- (IBAction)tailRateAction:(id)sender {
}
/**
 *立即参与
 */
- (IBAction)partakeRateAction:(id)sender {
    
    
    
}
- (void)awakeFromNib{
    
    [super awakeFromNib];
    [self setUpUI];

    
    
    
    
}
- (void)setUpUI{
    self.subtBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.subtBtn.layer.borderWidth = 1;
    self.rateText.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.rateText.layer.borderWidth = 1;
    self.addBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.addBtn.layer.borderWidth = 1;
    [self.fisrtRateBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    [self.secendRateBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    [self.thirdRateBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    [self.tailRateBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    
    self.fisrtRateBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.fisrtRateBtn.layer.borderWidth = 1;
    self.secendRateBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.secendRateBtn.layer.borderWidth = 1;
    self.thirdRateBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.thirdRateBtn.layer.borderWidth = 1;
    self.tailRateBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.tailRateBtn.layer.borderWidth = 1;
    
}


@end
