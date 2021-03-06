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

@property (weak, nonatomic) IBOutlet UILabel *productState;

@property (weak, nonatomic) IBOutlet UILabel *buyRedAndBlueBall;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (nonatomic,assign) NSInteger ms;
@property (nonatomic,assign) NSInteger minutes;
@property (nonatomic,assign) NSInteger seconds;
@property (nonatomic,weak) NSTimer *timer;
@end


static NSString *const cellItemID = @"PKPastListCell";
@implementation PKDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpUI];
}
- (void)setDetail:(PKDetailsModel *)detail{
    _detail = detail;
    
    self.productState.text = detail.type;
    self.produceName.text = detail.title;
    self.stageNum.text = detail.qishu;
    
    NSInteger buy_red = [detail.zongrenshu integerValue] - [detail.red_hasnum integerValue];
    NSInteger buy_blue = [detail.zongrenshu integerValue] - [detail.blue_hasnum integerValue];
    NSString *redString = [NSString stringWithFormat:@"%zd",buy_red];
    NSString *blueString = [NSString stringWithFormat:@"%zd",buy_blue];
    self.redNum.attributedText = [self setUpTextColorWith:[NSString stringWithFormat:@"%@人选择红球",redString] length:redString.length + 1 color:@"de2e52"];
    self.blueNum.attributedText = [self setUpTextColorWith:[NSString stringWithFormat:@"%@人选择蓝球",blueString] length:blueString.length + 1 color:@"2f9be3"];
    
    self.buyRedAndBlueBall.attributedText = [self setUpTextColorWith:[NSString stringWithFormat:@"您已经购买了%@个红球,%@个篮球",detail.buy_rednum,detail.buy_bluenum] length1:detail.buy_rednum.length + 3 color1:@"de2e52" length2:detail.buy_bluenum.length + 3 color2:@"2f9be3"];
    
    [self.produceIMG sd_setImageWithURL:[NSURL URLWithString:detail.picarr[0]] placeholderImage:[UIImage imageNamed:DefaultImage]];
    
    
    
    
    self.minutes = [detail.waittime integerValue] / 60;
    self.seconds = [detail.waittime integerValue] % 60;
    self.ms = 0;
    if(!self.timer)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(showCount:) userInfo:nil repeats:YES];
        //把定时器放到子线程
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
- (void)setUpUI{
    UIView *selectView = [[UIView alloc]initWithFrame:self.bounds];
    selectView.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = selectView;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.redBtn.tag = PKBallTypeRedBall;
    self.blueBtn.tag = PKBallTypeBlueBall;
    
    self.productState.layer.cornerRadius = 2;
    self.productState.layer.masksToBounds = YES;
    
    
    [self setUpCollectionView];
    
}
- (void)setUpCollectionView{
    

    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPastListCell class]) bundle:nil] forCellWithReuseIdentifier:cellItemID];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//
    
}
#pragma mark - 倒计时
-(void)showCount:(NSTimer *)timer
{
    //minutes 分钟
    //seconds 秒
    //ms 毫秒
    
    
    if (self.ms == 0)
    {
        
        
        if (self.minutes > 0 || self.seconds > 0)
        {
            self.ms = 100;
            if (self.seconds > 0)
            {
                self.seconds =  self.seconds - 1;
            }
            if (self.seconds == 0 && self.minutes > 0)
            {
                self.seconds = 59;
                self.minutes = self.minutes -1;
            }
            
        }
        
    }
    self.ms--;
    
    
    //    self.lblTime.text = [NSString stringWithFormat:@"揭晓倒计时：%d:%d:%d",self.minutes,self.seconds,self.ms];
//    self.lblTime.frame= CGRectMake(imgHeight + 20+20+10, 72,[UIScreen mainScreen].bounds.size.width - imgHeight - 30,30);
//    _lblTime.font = [UIFont systemFontOfSize:30];
//    self.lblTime.text = [NSString stringWithFormat:@"%02d:%02d:%02d",self.minutes,self.seconds,self.ms];
//    _latestModel.used_time = [NSString stringWithFormat:@"%zd",self.minutes*60+self.seconds];
    
    if (self.seconds == 0 && self.ms == 0 && self.minutes == 0)
    {
//        _lblTime.font = [UIFont systemFontOfSize:15];
//#warning 添加通知
//        _lblTime.text = @"正在开奖中...";
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"openPrize" object:_lblTime];

        [self.timer invalidate];
        self.timer = nil;
    }
    
    
}



#pragma mark <UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.detail.ball_list.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PKPastListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellItemID forIndexPath:indexPath];
    cell.model = self.detail.ball_list[indexPath.item];
    return cell;
    
}
/**
 购买红球Or篮球

 @param sender UIButton
 */
- (IBAction)selectRedOrBlueBall:(UIButton *)sender{
    
    [PKGlobalTool shareInstance].ballMoney = self.detail.money;
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pkDetailsCell:ballType:)]) {
        
        [self.delegate pkDetailsCell:self ballType:sender.tag];
    }
}
/**
 近期开奖结果

 @param sender UIButton
 */
- (IBAction)pastRecordAction:(id)sender {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pkDetailsCell:pastRecordResult:)]) {
        [self.delegate pkDetailsCell:self pastRecordResult:self.detail];
    }
    
}

/**
 图文详情

 @param sender UIButton
 */
- (IBAction)pictureDetailAction:(id)sender {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pkDetailsCell:prictureInfo:)]) {
        [self.delegate pkDetailsCell:self prictureInfo:self.detail];
    }
    
}
- (NSMutableAttributedString *)setUpTextColorWith:(NSString *)ptime length:(NSInteger )length color:(NSString *)color{
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:ptime];
    NSRange range = NSMakeRange(0, length);
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:color] range:range];
    
    return attribute;
}
- (NSMutableAttributedString *)setUpTextColorWith:(NSString *)string length1:(NSInteger)length1 color1:(NSString *)color1 length2:(NSInteger)length2 color2:(NSString *)color2{
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:string];
    NSRange range1 = NSMakeRange(6, length1);
    NSRange range2 = NSMakeRange(6+length1+1, length2);
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:color1] range:range1];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:color2] range:range2];
    return attribute;
}


@end
