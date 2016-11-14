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
@end

@implementation PKPastRecordController

static NSString *const cellID = @"PKPastRecordCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpInit];
    
    
    
}
- (void)setUpInit{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPastRecordCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
- (void)upAndpullRefresh{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downPullRefreshData)];
    [self.tableView.mj_header beginRefreshing];
    
}
- (void)requestData{
    NSDictionary *parameters = @{};
    NetworkTools *tools = [NetworkTools shareInstance];
    [tools request:GET URLString:PKPastRecordURL parameters:parameters finished:^(id responseObject, NSError *error) {
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
    [self requestData];
}
- (void)downPullRefreshData{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PKPastRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return cell;
    
    
    
}
- (NSMutableArray *)recordDataArray{
    if (!_recordDataArray) {
        self.recordDataArray = [NSMutableArray array];
    }
    return _recordDataArray;
}
@end
