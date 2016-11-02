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
@interface PKListViewController ()<UITableViewDelegate,UITableViewDataSource,PKListCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *listModels;
@end
static NSString *const listCellID = @"PKListCell";
@implementation PKListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
- (void)setUpUI{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKListCell class]) bundle:nil] forCellReuseIdentifier:listCellID];
}
//数据请求
- (void)requestData{
    
}
// 下拉刷新
- (void)pullDownLoadData{
    
    
    
}
// 上拉加载
- (void)pullUpLoadData{
    
}

#pragma mark <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
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
#pragma mark <PKListCellDelegate>
- (void)pkListCell:(PKListCell *)pkListCell listModel:(PKListModel *)listModel{
    
    
    
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
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, MSH - 450, MSW, 450) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
    return _tableView;
}
@end
