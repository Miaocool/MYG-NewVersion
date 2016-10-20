//
//  ChanceofViewController.m
//  myg
//
//  Created by Apple on 16/10/20.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "ChanceofViewController.h"
#import "ChanceSurperView.h"
@interface ChanceofViewController ()
@property (nonatomic,strong)ChanceSurperView *chanceSurperView;
@end

@implementation ChanceofViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self setUpUI];
    
    
    
}
/**
 *UI初始化
 */
- (void)setUpUI{
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    [self.view addSubview:self.chanceSurperView];
}
- (ChanceSurperView *)chanceSurperView{
    if (!_chanceSurperView) {
        _chanceSurperView = [[ChanceSurperView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-344, self.view.bounds.size.width, 344)];
    }
    return _chanceSurperView;
}
@end
