//
//  PKDetailsCell.m
//  myg
//
//  Created by Apple on 16/11/4.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKDetailsCell.h"

#import "PKPastListCell.h"


@interface PKDetailsCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIImageView *produceIMG;
@property (weak, nonatomic) IBOutlet UILabel *produceName;
@property (weak, nonatomic) IBOutlet UILabel *stageNum;
@property (weak, nonatomic) IBOutlet UILabel *countDownTime;
@property (weak, nonatomic) IBOutlet UIView *redHeight;
@property (weak, nonatomic) IBOutlet UILabel *redNum;
@property (weak, nonatomic) IBOutlet UIView *blueHeight;
@property (weak, nonatomic) IBOutlet UILabel *blueNum;
@property (weak, nonatomic) IBOutlet UIButton *redBtn;
@property (weak, nonatomic) IBOutlet UIButton *blueBtn;



@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end


static NSString *const cellItemID = @"PKPastListCell";
@implementation PKDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpUI];
}
- (void)setUpUI{
    UIView *selectView = [[UIView alloc]initWithFrame:self.bounds];
    selectView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = selectView;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.redBtn.tag = PKBallTypeRedBall;
    self.blueBtn.tag = PKBallTypeBlueBall;
    
    
    [self setUpCollectionView];
    
}
- (void)setUpCollectionView{
    

    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPastListCell class]) bundle:nil] forCellWithReuseIdentifier:cellItemID];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//
    
}

#pragma mark <UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PKPastListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellItemID forIndexPath:indexPath];
    return cell;
    
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(self.collectionView.height, self.collectionView.height);
//}

/**
 购买红球Or篮球

 @param sender UIButton
 */
- (IBAction)selectRedOrBlueBall:(UIButton *)sender {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pkDetailsCell:ballType:)]) {
        
        [self.delegate pkDetailsCell:self ballType:sender.tag];
    }
}
/**
 近期开奖结果

 @param sender UIButton
 */
- (IBAction)pastRecordAction:(id)sender {
}

/**
 图文详情

 @param sender UIButton
 */
- (IBAction)pictureDetailAction:(id)sender {
}



@end
