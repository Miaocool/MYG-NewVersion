//
//  HomeCollectionCell.m
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "HomeCollectionCell.h"
#import "UIImageView+WebCache.h"
@interface HomeCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productIcon;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIButton *involveBtn;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *surplusNum;

@end


@implementation HomeCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
    
    self.progress.layer.cornerRadius = 5;
    self.progress.userInteractionEnabled = YES;
    self.progress.layer.masksToBounds = YES;
    self.progress.transform = CGAffineTransformMakeScale(1.0f,2.0f);
    self.progress.trackTintColor=RGBCOLOR(253, 224, 202);
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    //    self.progressView.progress=0.7;
    //设置进度条上进度的颜色
    self.progress.progressTintColor=RGBCOLOR(247, 148, 40);
    
    //设置进度值并动画显示
    [self.progress setProgress:0.7 animated:YES];
    //设置进度值并动画显示
    [self.progress setProgress:0.7 animated:YES];
    
    self.involveBtn.layer.cornerRadius = 5;
    self.involveBtn.layer.masksToBounds = YES;
   
}
- (void)setGoodsModel:(GoodsModel *)goodsModel{
    _goodsModel = goodsModel;
       
}

@end
