//
//  PKPastRecordController.m
//  myg
//
//  Created by Apple on 16/11/7.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPastRecordController.h"
#import "PKPastRecordCell.h"
#import "MJRefresh.h"
#import "PKPastRecordModel.h"
@interface PKPastRecordController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *recordDataArray;
@property (nonatomic,assign)NSInteger page;
@end

@implementation PKPastRecordController

static NSString *const cellID = @"PKPastRecordCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpInit];
    
    
    
}
- (void)setUpInit{
    
    self.title = @"开奖记录";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MSW, self.view.height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPastRecordCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self upAndpullRefresh];
    
}
- (void)upAndpullRefresh{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downPullRefreshData)];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self.tableView.mj_header beginRefreshing];
    
}
- (void)requestData{
    self.page = 1;
    NSDictionary *parameters = @{@"sid":self.sid,@"p":[NSString stringWithFormat:@"%ld",(long)self.page]};
    NetworkTools *tools = [NetworkTools shareInstance];
    [tools request:GET URLString:PKDrawlistURL parameters:parameters finished:^(id responseObject, NSError *error) {
        if (responseObject == nil) {
            [self.tableView.mj_header endRefreshing];
        }else{
            [self.tableView.mj_header endRefreshing];
            self.recordDataArray = [PKPastRecordModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            [self.tableView reloadData];
        }
    }];
}
- (void)loadMoreData{
    
    
    self.page++;
    NSDictionary *parameters = @{@"sid":self.sid,@"p":[NSString stringWithFormat:@"%ld",(long)self.page]};
    NetworkTools *tools = [NetworkTools shareInstance];
    [tools request:GET URLString:PKDrawlistURL parameters:parameters finished:^(id responseObject, NSError *error) {
        if (responseObject == nil) {
            [self.tableView.mj_footer endRefreshing];
        }else{
            DebugLog(@"%@",responseObject[@"msg"]);
            [self.tableView.mj_footer endRefreshing];
            NSArray *array = [PKPastRecordModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            [self.recordDataArray addObjectsFromArray:array];
            [self.tableView reloadData];
        }
    }];
}
- (void)downPullRefreshData{
    [self requestData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recordDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PKPastRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.pastRecordModel = self.recordDataArray[indexPath.row];
    return cell;
    
}
- (NSMutableArray *)recordDataArray{
    if (!_recordDataArray) {
        self.recordDataArray = [NSMutableArray array];
    }
    return _recordDataArray;
}
@end
