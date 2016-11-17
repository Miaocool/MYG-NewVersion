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
#import "PKDetailsModel.h"
#import "PKPastRecordController.h"
#import "PictureDetailController.h"
@interface PKDetailViewController ()<UITableViewDelegate,UITableViewDataSource,PKDetailsCellDelegate,PKAnnounceHeaderViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITableView *announceTableView;
@property (nonatomic,strong)PKDetailFootView *footView;
@property (nonatomic,strong)PKAnnounceHeaderView *headerView;
@property (nonatomic,strong)NSMutableArray *alReadyArray;


@property (nonatomic,strong)PKDetailsModel *detailM;

@property (nonatomic,strong)NSMutableArray *models;

@property (nonatomic,strong)NSArray *myPairArray;
@property (nonatomic,strong)NSArray *allPairArray;

@property (nonatomic,strong)NSString *pkokNum;
@property (nonatomic,strong)NSString *pkfailNum;

@property (nonatomic,assign)BOOL isMeOrAll;

@end

static NSString *const cellID1 = @"PKDetailsCell";
static NSString *const cellID2 = @"PKAnnounceCell";
@implementation PKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestPairData];
    
    self.isMeOrAll = YES;
    
    [self setUpUI];
    [self setUpDownAndUpPullRefresh];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
/**
 初始化UI
 */
- (void)setUpUI{
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
    
    self.title = @"PK夺宝";
    
    [self NoAnnounceInit];
    
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
   
    PKDetailViewController *detailVC = [PKDetailViewController new];
    detailVC.isAlReady = NO;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}
/**
 未揭晓
 */
- (void)NoAnnounceInit{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKDetailsCell class]) bundle:nil] forCellReuseIdentifier:cellID1];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKAnnounceCell class]) bundle:nil] forCellReuseIdentifier:cellID2];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (_isAlReady) {
        self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 64 - 55);
        self.tableView.tableHeaderView = self.headerView;
        [self.view addSubview:self.footView];
        [self.footView.atOnceGoBtn addTarget:self action:@selector(atOnceGoBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }else{
        self.tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    }
}
- (void)setUpDownAndUpPullRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downPullRequestData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.announceTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downPullRequestData)];
    [self.announceTableView.mj_header beginRefreshing];
    
}
- (void)requestData{
//    NSDictionary *parameters = @{@"id":self.idd,@"yhid":self.zhongjiangID,@"sid":self.sid,@"logonuid":[UserDataSingleton userInformation].uid,@"qishu":self.qishu};
    
    [self.models removeAllObjects];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.idd forKey:@"id"];
    [dict setValue:self.zhongjiangID forKey:@"yhid"];
    [dict setValue:self.sid forKey:@"sid"];
    [dict setValue:[UserDataSingleton userInformation].uid forKey:@"logonuid"];
    [dict setValue:self.qishu forKey:@"qishu"];
    NetworkTools *tools = [NetworkTools shareInstance];
    [tools request:POST URLString:PKDetailURL parameters:dict finished:^(id responseObject, NSError *error) {
        if (responseObject == nil) {
            [self.tableView.mj_header endRefreshing];
        }else{
            [self.tableView.mj_header endRefreshing];
            DebugLog(@"data:%@",responseObject[@"data"]);
            if ([responseObject[@"data"] isEqual:@""]) {
                [SVProgressHUD showErrorWithStatus:@"网络不给力!"];
            }else{
                self.detailM = [PKDetailsModel mj_objectWithKeyValues:responseObject[@"data"]];
            }
            [self.models addObject:self.detailM];
            PKAnnounceHeaderView *header = (PKAnnounceHeaderView *)self.tableView.tableHeaderView;
            header.detail = [self.models firstObject];
            [self.tableView reloadData];
            
        }
    }];
}
/**
 下拉刷新
 */
- (void)downPullRequestData{
    [self requestData];
}

/**
 上拉加载
 */
- (void)upPullRequestData{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isAlReady) {

        if (self.isMeOrAll) {
            return self.myPairArray.count;
        }else{
            return self.allPairArray.count;
        }
    }else{
        return self.models.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (!_isAlReady) {
        PKDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
        cell.delegate = self;
        cell.detail = self.models[indexPath.row];
        return cell;
    }else{
        PKAnnounceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID2];
        if (self.isMeOrAll) {
            cell.user = self.myPairArray[indexPath.row];
        }else{
            cell.user = self.allPairArray[indexPath.row];
        }
        
        return cell;
    }    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!_isAlReady) {
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
    if (ballType == PKBallTypeRedBall) {
        [PKGlobalTool shareInstance].ballType = @"红球";
    }else{
        [PKGlobalTool shareInstance].ballType = @"蓝球";
    }
    [PKGlobalTool shareInstance].sid = self.detailM.id;
    [self presentViewController:nav animated:NO completion:nil];
}
- (void)pkDetailsCell:(PKDetailsCell *)pkDetailsCell prictureInfo:(PKDetailsModel *)ballModel{
    PictureDetailController *classVC = [[PictureDetailController alloc]init];
    classVC.idd=self.detailM.id;
    [self.navigationController pushViewController:classVC animated:YES];
    
}
- (void)pkDetailsCell:(PKDetailsCell *)pkDetailsCell pastRecordResult:(PKDetailsModel *)ballModel{
    
    PKPastRecordController *recordVC = [PKPastRecordController new];
    recordVC.sid = self.detailM.sid;
    [self.navigationController pushViewController:recordVC animated:YES];
}
#pragma mark <PKAnnounceHeaderViewDelegate>
- (void)pkAnnounceHeaderView:(PKAnnounceHeaderView *)pkAnnounceHeaderView button:(UIButton *)button{
    
    if (button.tag == 0) {
        self.isMeOrAll = YES;
    }else{
        self.isMeOrAll = NO;
    }
    [self.tableView reloadData];
    
}
- (void)requestPairData{
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.idd forKey:@"id"];
    [dict setValue:self.zhongjiangID forKey:@"yhid"];
    [dict setValue:self.sid forKey:@"sid"];
    [dict setValue:[UserDataSingleton userInformation].uid forKey:@"logonuid"];
    [dict setValue:self.qishu forKey:@"qishu"];
    
    
    
    [[NetworkTools shareInstance] request:GET URLString:PKPairInfoURL parameters:dict finished:^(id responseObject, NSError *error) {
        NSDictionary *dict = responseObject[@"data"];
        DebugLog(@"%@---%@",responseObject,dict);
        if (responseObject == nil) {
            DebugLog(@"error --- %@",error);
        }else{
            PKAnnounceHeaderView *header = (PKAnnounceHeaderView *)self.tableView.tableHeaderView;
            header.pkokNum = dict[@"pkoknum"];
            header.pkfailNum = dict[@"pkfailnum"];
            self.myPairArray = [PKUserPairModel mj_objectArrayWithKeyValuesArray:dict[@"mypklist"]];
            self.allPairArray = [PKUserPairModel mj_objectArrayWithKeyValuesArray:dict[@"pklist"]];
        }
        [self.tableView reloadData];
    }];
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
        self.headerView.delegate = self;
    }
    return _headerView;
}
- (PKDetailsModel *)detailM{
    if (!_detailM) {
        self.detailM = [PKDetailsModel new];
    }
    return _detailM;
}
- (NSMutableArray *)models{
    if (!_models) {
        self.models = [NSMutableArray array];
    }
    return _models;
}
- (NSArray *)myPairArray{
    if (!_myPairArray) {
        self.myPairArray = [NSArray array];
    }
    return _myPairArray;
}
- (NSArray *)allPairArray{
    if (!_allPairArray) {
        self.allPairArray = [NSArray array];
    }
    return _allPairArray;
}

@end
