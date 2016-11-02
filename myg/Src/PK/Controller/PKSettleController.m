//
//  PKSettleController.m
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKSettleController.h"

@interface PKSettleController ()
@property (nonatomic,strong)UIView *coverView;

@end

@implementation PKSettleController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    
//     self.view.backgroundColor = [UIColor purpleColor];
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
//    view.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:view];
//    
//}

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        
    }
    return self;
}

- (void)containerViewWillLayoutSubviews{
    
    //修改弹出视图的大小
    self.presentedView.frame = self.pressentFrame;
    [self.containerView insertSubview:self.coverView atIndex:0];
    
}
- (UIView *)coverView{
    if (!_coverView) {
        self.coverView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.coverView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
        [self.coverView addGestureRecognizer:tapGR];
    }
    return _coverView;
}
- (void)close{
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
