//
//  MYGPushGuideView.m
//  myg
//
//  Created by Apple on 16/10/27.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "MYGPushGuideView.h"
static MYGPushGuideView *guideView;
@implementation MYGPushGuideView

+ (instancetype)guideView{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guideView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
        guideView.frame = [UIScreen mainScreen].bounds;
    });
    return guideView;
}
- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:guideView];
}
- (void)dismiss{
    
    [guideView removeFromSuperview];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}
@end
