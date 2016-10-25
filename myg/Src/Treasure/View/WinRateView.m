//
//  WinRateView.m
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "WinRateView.h"

@interface WinRateView ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *subtBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *rateText;
@property (weak, nonatomic) IBOutlet UIButton *fisrtRateBtn;
@property (weak, nonatomic) IBOutlet UIButton *secendRateBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdRateBtn;
@property (weak, nonatomic) IBOutlet UIButton *tailRateBtn;
@property (weak, nonatomic) IBOutlet UILabel *sumRate;
@property (weak, nonatomic) IBOutlet UIButton *partakeRateBtn;
@property (nonatomic,assign)CGFloat lowValue;
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

- (IBAction)subBtnAction:(id)sender {
    
    
}

- (IBAction)addBtnAction:(id)sender {
    
    
    
    
    
}


/**
 *立即参与
 */
- (IBAction)partakeRateAction:(id)sender {
    DebugLog(@"-----结算-----");
    ShoppingModel *model = [UserDataSingleton userInformation].shopModel;
    model.num = [self.sumRate.text integerValue];
    [UserDataSingleton userInformation].shopModel = model;
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(winRateView:goodModel:)]) {
        [self.delegate winRateView:self goodModel:[UserDataSingleton userInformation].shopModel];
    }
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
    self.rateText.returnKeyType = UIReturnKeyDone;
    self.rateText.delegate = self;
    self.rateText.textAlignment = NSTextAlignmentCenter;
    [self setUpRateWithRequestData];
    
    [self calculateDegaultValue];
    
}
- (void)setUpRateWithRequestData{
    
    
    NSInteger prize = [[UserDataSingleton userInformation].listModel.zongrenshu integerValue];
    if (prize > 1 && prize <= 99 ) {
        [self.fisrtRateBtn setTitle:@"10%" forState:UIControlStateNormal];
        [self.secendRateBtn setTitle:@"25%" forState:UIControlStateNormal];
        [self.thirdRateBtn setTitle:@"40%" forState:UIControlStateNormal];
    }else if (prize > 99 && prize <= 999){
        [self.fisrtRateBtn setTitle:@"10%" forState:UIControlStateNormal];
        [self.secendRateBtn setTitle:@"20%" forState:UIControlStateNormal];
        [self.thirdRateBtn setTitle:@"30%" forState:UIControlStateNormal];
    }else if (prize >= 1000){
        [self.fisrtRateBtn setTitle:@"10%" forState:UIControlStateNormal];
        [self.secendRateBtn setTitle:@"25%" forState:UIControlStateNormal];
        [self.thirdRateBtn setTitle:@"25%" forState:UIControlStateNormal];
    }
    
    
    
}

/**
 计算默认值
 */
- (void)calculateDegaultValue{
    NSString *surplus = [UserDataSingleton userInformation].listModel.shengyurenshu;
    NSString *sumPtime = [UserDataSingleton userInformation].listModel.zongrenshu;
    CGFloat ratio = [surplus floatValue] / [sumPtime floatValue];
    if (ratio >= 0.01 && ratio < 0.1) {
        self.rateText.text = @"1%";
    }else if (ratio >= 0.1){
        self.rateText.text = @"10%";
    }else if (ratio < 0.01){
        
    }
    self.lowValue = ratio;
    NSInteger initPtime = 0;
    CGFloat f1 = ([[UserDataSingleton userInformation].listModel.shengyurenshu floatValue] * ([self.rateText.text floatValue] * 0.01));
    NSInteger f2 = ((NSInteger)[[UserDataSingleton userInformation].listModel.shengyurenshu floatValue] * ([self.rateText.text floatValue] * 0.01));
    CGFloat ff = f1 / f2;
    if (ff == 1) {
        initPtime = (NSInteger)(f2);
    }else{
        initPtime = (NSInteger)(f2 + 1);
    }
    self.sumRate.text = [NSString stringWithFormat:@"%zd",initPtime];
    DebugLog(@"%f",[self.rateText.text floatValue]);
    
}
/**
 截取字符串，并转化成小数
 
 @param string
 */
- (CGFloat)transformWithString:(NSString *)string{
    NSString *newString = [string substringToIndex:2];
    CGFloat number = [newString integerValue] * 0.01;
    return number;
}
#pragma mark <UITextFieldDelegate>
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.rateText resignFirstResponder];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    DebugLog(@"-----停止输入------");
    NSInteger finalPtime = 0;
    CGFloat endValue = [textField.text floatValue] * 0.01;
    if (self.lowValue < 0.01) {
        [SVProgressHUD showErrorWithStatus:@"请到经典模式购买！"];
    }else if (endValue >= self.lowValue){
        textField.text  = [NSString stringWithFormat:@"%zd%%",(NSInteger)(self.lowValue * 100 + 1)];
        [self createLayerBoardLineWith:self.tailRateBtn];
    }else{
        textField.text  = [NSString stringWithFormat:@"%@%%",textField.text];
        
        CGFloat f1 = ([[UserDataSingleton userInformation].listModel.shengyurenshu floatValue] * endValue);
        NSInteger f2 = ((NSInteger)[[UserDataSingleton userInformation].listModel.shengyurenshu floatValue] * endValue);
        CGFloat ff = f1 / f2;
        if (ff == 1) {
            finalPtime = (NSInteger)(f2);
        }else{
            finalPtime = (NSInteger)(f2 + 1);
        }
        self.sumRate.text = [NSString stringWithFormat:@"%zd",finalPtime];
    }
}
- (void)createLayerBoardLineWith:(UIButton *)view{
    [view setTitleColor:[UIColor colorWithHexString:@"#de2f50"] forState:UIControlStateNormal];
    view.layer.borderColor = [UIColor colorWithHexString:@"#de2f50"].CGColor;
    view.layer.borderWidth = 1;
}



@end
