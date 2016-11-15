//
//  PKListViewController.m
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKListViewController.h"
#import "PKListCell.h"
#import "PKDetailViewController.h"


#import "PKListModel.h"

@interface PKListViewController ()<UITableViewDelegate,UITableViewDataSource,PKListCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *listModels;
@property (nonatomic, strong) NoNetwork *nonetwork;
@end
static NSString *const listCellID = @"PKListCell";
@implementation PKListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setUpUI];
    
}
- (void)setUpUI{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKListCell class]) bundle:nil] forCellReuseIdentifier:listCellID];
    self.left.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    

    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 200, 44);
    label.text = @"PK专场";
    label.font = [UIFont systemFontOfSize:22];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
    [self setUpDownAndUpPullRefresh];
}
- (void)setUpDownAndUpPullRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
    [self.tableView.mj_header beginRefreshing];
}

//数据请求
- (void)requestData1{
    
    NetworkTools *tools = [NetworkTools shareInstance];
    NSDictionary *parameters = @{@"order":@"10",@"p":@"1"};
    [tools request:GET URLString:PKListURL parameters:parameters finished:^(id responseObject, NSError *error) {
        DebugLog(@"--- %@ --- %@",responseObject,error);
        if (responseObject == nil) {
            [self nonetworking];
            [self.tableView.mj_header endRefreshing];
        }else{
            [self.nonetwork removeFromSuperview];
            if ([responseObject[@"code"] isEqual:@"400"]) {
                [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
            }
            
            
            [self.tableView.mj_header endRefreshing];
            self.listModels = [PKListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            [self.tableView reloadData];
        }
    }];
}
// 下拉刷新
- (void)pullDownLoadData{
    
    
    [self requestData1];
    
}
// 上拉加载
- (void)pullUpLoadData{
    
}

#pragma mark <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PKListCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellID];
    cell.delegate = self;
    cell.listModel = self.listModels[indexPath.section];
    return cell;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == self.listModels.count){
        return 0;
    }else{
        return 7;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
     if (section == self.listModels.count - 1){
        return 1;
    }else{
        return 7;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MSW, 7)];
    headerView.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MSW, 7)];
    footerView.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    return footerView;
}
#pragma mark <PKListCellDelegate>
- (void)pkListCell:(PKListCell *)pkListCell listModel:(PKListModel *)listModel{
    
    PKDetailViewController *pkdetailsVC = [PKDetailViewController new];
    pkdetailsVC.isAlReady = YES;
    pkdetailsVC.idd = [NSString stringWithFormat:@"%zd",listModel.id];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:pkdetailsVC animated:YES];
    
}
- (void)nonetworking
{
    if (!self.nonetwork)
    {
        self.nonetwork = [[NoNetwork alloc]init];
        
        [self.nonetwork.btrefresh addTarget:self action:@selector(requestData1) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:self.nonetwork];
}
#pragma  mark <懒加载>
- (NSMutableArray *)listModels{
    if (!_listModels) {
        self.listModels = [NSMutableArray array];
    }
    return _listModels;
}
- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MSW, MSH-48-64) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
    return _tableView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    self.hidesBottomBarWhenPushed = NO;
}
@end
