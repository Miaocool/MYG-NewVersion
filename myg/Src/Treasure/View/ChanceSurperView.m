//
//  ChanceSurperView.m
//  myg
//
//  Created by Apple on 16/10/20.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "ChanceSurperView.h"
#import "PeopleTimeView.h"
#import "WinRateView.h"
#import "TheWiningCell.h"
#import "BettingToolView.h"
@interface ChanceSurperView ()<WinRateViewDelegate,PeopleTimeViewDelegate,UITableViewDelegate,UITableViewDataSource,BettingToolViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *beforeModelArray;
@property (nonatomic,strong)BettingToolView *bettingToolView;
@property (nonatomic,assign)CGFloat startOffsetX;
@end
@implementation ChanceSurperView

static NSString *const cellID = @"cellID";
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
    
    self.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.scrollView];

    BettingToolView *bettingToolView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BettingToolView class]) owner:nil options:nil].lastObject;
    bettingToolView.frame = CGRectMake(0, 0, MSW, 40);
    [self addSubview:bettingToolView];
    bettingToolView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TheWiningCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    self.startOffsetX = 0;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        
        
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, MSW, 304)];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.contentSize = CGSizeMake(MSW * 3, 0);
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor redColor];

        
        WinRateView *rateView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WinRateView class]) owner:nil options:nil].lastObject;
        rateView.frame = CGRectMake(0, 0, MSW, 309);
        rateView.delegate = self;
        [_scrollView addSubview:rateView];
        
        PeopleTimeView *peopleTimeView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PeopleTimeView class]) owner:nil options:nil].lastObject;
        peopleTimeView.delegate = self;
        peopleTimeView.frame = CGRectMake(MSW, 0, MSW, 309);
        [_scrollView addSubview:peopleTimeView];
        
        [_scrollView addSubview:_tableView];
        
        
    }
    return _scrollView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(MSW*2, 0, MSW, 309) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
   return _tableView;
}
#pragma mark -WinRateViewDelegate
- (void)winRateView:(WinRateView *)winRateView goodModel:(ShoppingModel *)good{
    
}
#pragma mark -PeopleTimeViewDelegate
- (void)peopleTimeView:(PeopleTimeView *)peopleTimeView good:(ShoppingModel *)good{
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TheWiningCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
}
#pragma mark -BettingToolViewDelegate
- (void)bettingToolView:(BettingToolView *)bettingToolView index:(NSInteger)index{
    
    [_scrollView setContentOffset:CGPointMake(index * MSW, 0) animated:YES];
   
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    DebugLog(@"begin --- %f",scrollView.contentOffset.x);
    self.startOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    DebugLog(@"did --- %f",scrollView.contentOffset.x);
    
    NSInteger source = 0;
    NSInteger target = 0;
    CGFloat contOffsetX = scrollView.contentOffset.x;
    if (contOffsetX > self.startOffsetX) { //左滑
//        source = 
    } else { //右滑
        
    }
    
}

#pragma mark - 往期中奖data
- (NSMutableArray *)beforeModelArray{
    if (!_beforeModelArray) {
        self.beforeModelArray = [NSMutableArray array];
    }
    return _beforeModelArray;
}


@end
