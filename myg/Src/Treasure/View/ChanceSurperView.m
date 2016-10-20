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
@interface ChanceSurperView ()<WinRateViewDelegate,PeopleTimeViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *beforeModelArray;
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

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TheWiningCell class]) bundle:nil] forCellReuseIdentifier:cellID];
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 35, MSW, 309)];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.contentSize = CGSizeMake(MSW * 3, 0);
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
#pragma mark - 往期中奖data
- (NSMutableArray *)beforeModelArray{
    if (!_beforeModelArray) {
        self.beforeModelArray = [NSMutableArray array];
    }
    return _beforeModelArray;
}


@end
