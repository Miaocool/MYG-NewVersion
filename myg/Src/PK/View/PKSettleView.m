//
//  PKSettleView.m
//  myg
//
//  Created by 李艳楠 on 16/10/29.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKSettleView.h"

typedef NS_ENUM(NSInteger, UIButtonTagValue) {
    UIButtonTagValueFirst = 0,
    UIButtonTagValueSecend,
    UIButtonTagValueThird,
    UIButtonTagValueFour,
    UIButtonTagValueSub,
    UIButtonTagValueAdd
};


@interface PKSettleView ()
@property (weak, nonatomic) IBOutlet UILabel *identBall;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *ballText;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secendBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;

@property (nonatomic,strong)UIButton *ballNumBtn;
@property (weak, nonatomic) IBOutlet UILabel *prizeAndBallCount;

@end



@implementation PKSettleView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}
- (void)setUpUI{
    self.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    self.identBall.backgroundColor = [UIColor whiteColor];
    self.firstBtn.tag = UIButtonTagValueFirst;
    self.secendBtn.tag = UIButtonTagValueSecend;
    self.thirdBtn.tag = UIButtonTagValueThird;
    self.fourBtn.tag = UIButtonTagValueFour;
    self.addBtn.tag = UIButtonTagValueAdd;
    self.subBtn.tag = UIButtonTagValueSub;
    
    [self setButtonTitleWith:self.firstBtn];
    [self setButtonTitleWith:self.secendBtn];
    [self setButtonTitleWith:self.thirdBtn];
    [self setButtonTitleWith:self.fourBtn];
    
    [self setInitLayerWith:self.firstBtn];
    [self setInitLayerWith:self.secendBtn];
    [self setInitLayerWith:self.thirdBtn];
    [self setInitLayerWith:self.fourBtn];
    
//    [self setInitLayerWith:self.addBtn];
//    [self setInitLayerWith:self.subBtn];
    
    self.ballText.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.ballText.layer.borderWidth = 0.5;
    self.addBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.addBtn.layer.borderWidth = 0.5;
    self.subBtn.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    self.subBtn.layer.borderWidth = 0.5;
    
}
- (IBAction)subAndAdd:(UIButton *)sender {
    NSInteger count = [self.ballText.text integerValue];
    if (sender.tag == UIButtonTagValueSub) {
        count--;
        if (count < 1) {
            self.ballText.text = @"1";
            self.prizeAndBallCount.text = @"合计：200米币（1个红球）";
            [SVProgressHUD showErrorWithStatus:@"不能低于最低数量!"];
        }else{
            self.ballText.text = [NSString stringWithFormat:@"%zd",count];
            self.prizeAndBallCount.text = [NSString stringWithFormat:@"合计：200米币（%zd个红球）",count];
        }
    }else if (sender.tag == UIButtonTagValueAdd){
        count++;
        self.ballText.text = [NSString stringWithFormat:@"%zd",count];
        self.prizeAndBallCount.text = [NSString stringWithFormat:@"合计：200米币（%zd个红球）",count];
    }
    [self setLayerBoardNormalAndSelect];
}
- (void)setLayerBoardNormalAndSelect{
    if ([self.ballText.text isEqualToString:self.firstBtn.titleLabel.text]) {
        [self setSelectLayerBoardWith:self.firstBtn];
    }else{
        [self setNormalLayerBoardWith:self.firstBtn];
    }
    if ([self.ballText.text isEqualToString:self.secendBtn.titleLabel.text]) {
        [self setSelectLayerBoardWith:self.secendBtn];
    }else{
        [self setNormalLayerBoardWith:self.secendBtn];
    }
    if ([self.ballText.text isEqualToString:self.thirdBtn.titleLabel.text]) {
        [self setSelectLayerBoardWith:self.thirdBtn];
    }else{
        [self setNormalLayerBoardWith:self.thirdBtn];
    }
    if ([self.ballText.text isEqualToString:self.fourBtn.titleLabel.text]) {
        [self setSelectLayerBoardWith:self.fourBtn];
    }else{
        [self setNormalLayerBoardWith:self.fourBtn];
    }
}
- (IBAction)selectBallNumAction:(UIButton *)sender {
    
    self.ballText.text = sender.titleLabel.text;
    self.prizeAndBallCount.text = [NSString stringWithFormat:@"合计：200米币（%@个红球）",sender.titleLabel.text];
    if (![self.ballNumBtn isEqual:sender]) {
        [self setNormalLayerBoardWith:self.ballNumBtn];
    }
    [self setSelectLayerBoardWith:sender];
    self.ballNumBtn = sender;
}
- (IBAction)settleAction:(id)sender {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pkSettleView:shopModel:)]) {
        [self.delegate pkSettleView:self shopModel:nil];
    }
    
}
- (void)setNormalLayerBoardWith:(UIButton *)button{
    button.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    button.layer.borderWidth = 1;
    button.selected = NO;
    
}
- (void)setSelectLayerBoardWith:(UIButton *)button{
    
    button.layer.borderColor = [UIColor colorWithHexString:@"#de2f50"].CGColor;
    button.layer.borderWidth = 1;
    button.selected = YES;
}
- (void)setButtonTitleWith:(UIButton *)button{
    [button setTitleColor:[UIColor colorWithHexString:@"#232323"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#de2f50"] forState:UIControlStateSelected];
}
- (void)setInitLayerWith:(UIButton *)button{
    
    button.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    button.layer.borderWidth = 1;
    
}
@end
