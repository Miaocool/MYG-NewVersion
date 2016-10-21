//
//  BettingToolView.m
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "BettingToolView.h"

@interface BettingToolView ()
/** 经典模式 */
@property (weak, nonatomic) IBOutlet UIButton *classicsBtn;
/** 中奖参谋 */
@property (weak, nonatomic) IBOutlet UIButton *staffBtn;
/** 高中奖率模式 */
@property (weak, nonatomic) IBOutlet UIButton *heighRateBtn;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (nonatomic,assign)NSInteger currentTag;
@end

@implementation BettingToolView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}
- (void)setUpUI{
    self.classicsBtn.tag = 100;
    self.staffBtn.tag = 101;
    self.heighRateBtn.tag = 102;
    _currentTag = 100;
    [self.classicsBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    [self.classicsBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.staffBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    [self.staffBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.heighRateBtn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
    [self.heighRateBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)allBtnAction:(UIButton *)cilck{
    if (cilck.tag == _currentTag) {
        return;
    }else{
        [cilck setTitleColor:[UIColor colorWithHexString:@"#da264d"] forState:UIControlStateNormal];
        CGRect frame = _lineView.frame;
        frame.origin.x = cilck.frame.origin.x;
        frame.size.width = cilck.frame.size.width;
        [UIView animateWithDuration:0.2 animations:^{
            _lineView.frame = frame;
        }];
        UIButton *btn = (UIButton *)[self viewWithTag:_currentTag];
        [btn setTitleColor:[UIColor colorWithHexString:@"#040404"] forState:UIControlStateNormal];
        _currentTag = cilck.tag;
    }
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(bettingToolView:index:)]) {
        [self.delegate bettingToolView:self index:_currentTag-100];
    }
}
- (void)setTitleWithSourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex{
    
    UIButton *btn = [self viewWithTag:sourceIndex];
    
    
}
@end
