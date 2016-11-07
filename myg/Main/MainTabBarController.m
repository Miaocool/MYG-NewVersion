//
//  MainTabBarController.m
//  myg
//
//  Created by Apple on 16/11/3.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
@property (nonatomic,strong)UIButton *centerBtn;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self addComposeBtn];
    
    
    
}
- (void)addComposeBtn{

    [self.tabBar addSubview:self.centerBtn];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 5;
    CGRect rect = CGRectMake(0, 0, width, 66);
    _centerBtn.frame = CGRectOffset(rect, 2*width, -18);
}
- (UIButton *)centerBtn{
    if (!_centerBtn) {
        self.centerBtn = [[UIButton alloc] init];
//        self.centerBtn.backgroundColor = [UIColor whiteColor];
        [self.centerBtn setImage:[UIImage imageNamed:@"hui"] forState:UIControlStateNormal];
        [self.centerBtn setImage:[UIImage imageNamed:@"pkicon"] forState:UIControlStateSelected];
        [self.centerBtn setTitle:@"PK专区" forState:UIControlStateNormal];
        
        [self.centerBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self.centerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [self.centerBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [self.centerBtn sizeToFit];
        self.centerBtn.imageEdgeInsets = UIEdgeInsetsMake(-15, 12, 0, -self.centerBtn.titleLabel.bounds.size.width);
        self.centerBtn.titleEdgeInsets = UIEdgeInsetsMake(self.centerBtn.imageView.bounds.size.height+2, -self.centerBtn.imageView.bounds.size.width, 0, 0);
        [self.centerBtn addTarget:self action:@selector(pkAction:) forControlEvents:UIControlEventTouchUpInside];
        self.centerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.centerBtn.adjustsImageWhenHighlighted = NO;
        [self.centerBtn.layer removeAllAnimations];
    }
    return _centerBtn;
}
- (void)pkAction:(UIButton *)click{
    if (!click.selected) {
        click.selected = !click.selected;
    }
    [super setSelectedIndex:2];
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (self.centerBtn.selected) {
        self.centerBtn.selected = !self.centerBtn.selected;
    }
}


@end
