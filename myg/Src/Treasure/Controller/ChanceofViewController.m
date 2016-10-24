//
//  ChanceofViewController.m
//  myg
//
//  Created by Apple on 16/10/20.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "ChanceofViewController.h"
#import "ChanceSurperView.h"
#import "BettingToolView.h"
@interface ChanceofViewController ()
@property (nonatomic,strong)ChanceSurperView *chanceSurperView;
@property (nonatomic,assign)BOOL isKeyboardVisible;
@end

@implementation ChanceofViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 初始化
    [self setUpUI];
    
    DebugLog(@"待处理的数据： %@",[UserDataSingleton userInformation].shopModel);
    [self keyboardNotification];
   
}
/** 
 *键盘收起与弹出
 */
- (void)keyboardNotification{
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardWillHideNotification object:nil];
    
}
/** 
 *弹出
 */
- (void)keyboardShow{
    DebugLog(@"keyboard will show");
    _isKeyboardVisible = YES;
    CGRect frame =  self.chanceSurperView.frame;
    frame.origin.y = self.chanceSurperView.frame.origin.y - 100;
    [UIView animateWithDuration:0.3 animations:^{
        self.chanceSurperView.frame = frame;
    }];
}
/**
 *隐藏
 */
- (void)keyboardHide{
    _isKeyboardVisible = NO;
    DebugLog(@"keyboard will hide");
    CGRect frame =  self.chanceSurperView.frame;
    frame.origin.y = self.chanceSurperView.frame.origin.y + 100;
    [UIView animateWithDuration:0.3 animations:^{
        self.chanceSurperView.frame = frame;
    }];
}



/**
 *UI初始化
 */
- (void)setUpUI{
    
    /**  
     *{
     shengyurenshu = 2776;
     shopid = 10125;
     thumb = "http://www.miyungou.com/statics/uploads/shopimg/20161021/73974172014777.jpg";
     title = "\U3010\U65b0\U54c1\U3011SMARTISAN\U9524\U5b50 M1L \U5168\U7f51\U901a4G\U667a\U80fd\U624b\U673aLT23";
     xiangou = 0;
     yunjiage = 1;
     zongrenshu = 3959;
     }
     */
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    [self.view addSubview:self.chanceSurperView];
    
   
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGRect frame = self.chanceSurperView.frame;
    frame.origin.y = self.view.bounds.size.height - 344;
    [UIView animateWithDuration:0.2 animations:^{
        self.chanceSurperView.frame = frame;
    }];
}
- (ChanceSurperView *)chanceSurperView{
    if (!_chanceSurperView) {
        _chanceSurperView = [[ChanceSurperView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 344)];
    }
    return _chanceSurperView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (_isKeyboardVisible) {
        [self.view endEditing:YES];
    }else{
        if (![[touches anyObject].view isKindOfClass:[BettingToolView class]]) {
            CGRect frame = self.chanceSurperView.frame;
            frame.origin.y = self.view.bounds.size.height;
            [UIView animateWithDuration:0.3 animations:^{
                self.chanceSurperView.frame = frame;
            }];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:nil];
            });
        }
    }
    DebugLog(@"%@",[touches anyObject].view);
  
}

@end
