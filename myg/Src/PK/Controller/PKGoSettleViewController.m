//
//  PKGoSettleViewController.m
//  myg
//
//  Created by Apple on 16/11/8.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKGoSettleViewController.h"
#import "PKSettleView.h"
@interface PKGoSettleViewController ()

@property (nonatomic,strong)PKSettleView *pksettleView;
@property (nonatomic,assign)BOOL isKeyboardVisible;
@end

@implementation PKGoSettleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)setUpUI{
    
//    self.navigationController.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    [self.view addSubview:self.pksettleView];
    
    [self keyboardNotification];
    
}
- (PKSettleView *)pksettleView{
    if (!_pksettleView) {
        self.pksettleView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PKSettleView class]) owner:nil options:nil].lastObject;
        self.pksettleView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 300);
        
    }
    return _pksettleView;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGRect frame = self.pksettleView.frame;
    frame.origin.y = self.view.bounds.size.height - 300;
    [UIView animateWithDuration:0.2 animations:^{
        self.pksettleView.frame = frame;
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (_isKeyboardVisible) {
        [self.view endEditing:YES];
    }else{
        
        
        if (![[touches anyObject].view isKindOfClass:[self.pksettleView class]]) {
            CGRect frame = self.pksettleView.frame;
            frame.origin.y = self.view.bounds.size.height;
            [UIView animateWithDuration:0.3 animations:^{
                self.pksettleView.frame = frame;
            }];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:nil];
            });
            
        }
    }
    DebugLog(@"%@",[touches anyObject].view);
    
}
/**
 *键盘收起与弹出
 */
- (void)keyboardNotification{
    DebugLog(@"aaa");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardWillHideNotification object:nil];
}
/**
 *弹出
 */
- (void)keyboardShow{
    DebugLog(@"keyboard will show");
    
    
    if (_isKeyboardVisible) {
        return;
    }else{
        CGRect frame =  self.pksettleView.frame;
        frame.origin.y = self.pksettleView.frame.origin.y - 100;
        DebugLog(@"%f",self.pksettleView.frame.origin.x);
        [UIView animateWithDuration:0.3 animations:^{
            DebugLog(@"%f",self.pksettleView.frame.origin.x);
            self.pksettleView.frame = frame;
            DebugLog(@"%f",self.pksettleView.frame.origin.x);
        }];
        _isKeyboardVisible = YES;
    }
}
/**
 *隐藏
 */
- (void)keyboardHide{
    _isKeyboardVisible = NO;
    DebugLog(@"keyboard will hide");
    CGRect frame =  self.pksettleView.frame;
    frame.origin.y = MSH - self.pksettleView.frame.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        self.pksettleView.frame = frame;
    }];
}


@end
