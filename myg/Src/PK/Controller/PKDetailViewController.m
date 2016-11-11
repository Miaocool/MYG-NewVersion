//
//  PKDetailViewController.m
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKDetailViewController.h"
#import "PKDetailsCell.h"
#import "PKGoSettleViewController.h"
#import "PKDetailFootView.h"
#import "PKAnnounceHeaderView.h"
#import "PKAnnounceCell.h"
#import "SettlementViewController.h"
@interface PKDetailViewController ()<UITableViewDelegate,UITableViewDataSource,PKDetailsCellDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITableView *announceTableView;
@property (nonatomic,strong)PKDetailFootView *footView;
@property (nonatomic,strong)PKAnnounceHeaderView *headerView;
@property (nonatomic,strong)NSMutableArray *alReadyArray;


@end

static NSString *const cellID1 = @"PKDetailsCell";
static NSString *const cellID2 = @"PKAnnounceCell";
@implementation PKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpUI];
    
}
/**
 初始化UI
 */
- (void)setUpUI{
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
    
    self.title = @"PK夺宝";

    if (!_isAlReady) {
        [self alReadyInit];
    }else{
       [self NoAnnounceInit];
    }
}
/**
 已揭晓
 */
- (void)alReadyInit{

    [self.view addSubview:self.announceTableView];
    
    
    self.announceTableView.tableHeaderView = self.headerView;
    
    self.announceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.footView];
    [self.footView.atOnceGoBtn addTarget:self action:@selector(atOnceGoBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.announceTableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKAnnounceCell class]) bundle:nil] forCellReuseIdentifier:cellID2];
    
    
    
}
/**
 *立即前往购买
 */
- (void)atOnceGoBtnAction{
   
    
    
}
/**
 未揭晓
 */
- (void)NoAnnounceInit{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKDetailsCell class]) bundle:nil] forCellReuseIdentifier:cellID1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

/**
 下拉刷新
 */
- (void)downPullRequestData{
    
}

/**
 上拉加载
 */
- (void)upPullRequestData{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.tableView]) {
        return 1;
    }else{
        return 20;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([tableView isEqual:self.tableView]) {
        PKDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
        cell.delegate = self;
        return cell;
    }else{
        PKAnnounceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID2];

        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.tableView]) {
        return self.view.height;
    }else{
        return 125;
    }
}
#pragma mark <PKDetailsCellDelegate>
- (void)pkDetailsCell:(PKDetailsCell *)pkDetailsCell ballType:(PKBallType)ballType{
    
    PKGoSettleViewController *pksettleVC = [[PKGoSettleViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:pksettleVC];
    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
//    [self.navigationController pushViewController:pksettleVC animated:YES];
    
    [self presentViewController:nav animated:NO completion:nil];
}


- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MSW, self.view.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
        self.tableView.dataSource = self;
    }
    return _tableView;
}
- (UITableView *)announceTableView{
    if (!_announceTableView) {
        self.announceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MSW, self.view.height - 64 - 55) style:UITableViewStylePlain];
        self.announceTableView.delegate = self;
        self.announceTableView.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
//        self.announceTableView.backgroundColor = [UIColor redColor];
        self.announceTableView.dataSource = self;

    }
    return _announceTableView;
}
- (PKDetailFootView *)footView{
    if (!_footView) {
        self.footView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PKDetailFootView class]) owner:nil options:nil].lastObject;
        self.footView.frame = CGRectMake(0, MSH-64-55, MSW, 100);
        self.footView.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    }
    return _footView;
}
- (PKAnnounceHeaderView *)headerView{
    if (!_headerView) {
        self.headerView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PKAnnounceHeaderView class]) owner:nil options:nil].lastObject;
        self.headerView.frame = CGRectMake(0, 0, self.view.width, 490);
    }
    return _headerView;
}

@end
