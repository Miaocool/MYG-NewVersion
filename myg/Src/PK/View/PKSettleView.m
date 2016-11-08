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
    
}
- (IBAction)subAndAdd:(UIButton *)sender {
    NSInteger count = [self.ballText.text integerValue];
    if (sender.tag == UIButtonTagValueSub) {
        count--;
        if (count < 1) {
            self.ballText.text = @"1";
            [SVProgressHUD showErrorWithStatus:@"不能低于最低数量!"];
        }else{
            self.ballText.text = [NSString stringWithFormat:@"%zd",count];
        }
    }else if (sender.tag == UIButtonTagValueAdd){
        count++;
        self.ballText.text = [NSString stringWithFormat:@"%zd",count];
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
    [button setTitleColor:[UIColor colorWithHexString:@"#939393"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#de2f50"] forState:UIControlStateSelected];
}
- (void)setInitLayerWith:(UIButton *)button{
    
    button.layer.borderColor = [UIColor colorWithHexString:@"#e1e1e1"].CGColor;
    button.layer.borderWidth = 1;
    
}
@end
