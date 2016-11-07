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
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    
//    self.navigationController.navigationItem.title = @"PK专场";
    
//    self.tabBarItem.title = @"";
    
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
//    cell.listModel = self.listModels[indexPath.section];
    return cell;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
#pragma mark <PKListCellDelegate>
- (void)pkListCell:(PKListCell *)pkListCell listModel:(PKListModel *)listModel{
    
    PKDetailViewController *pkdetailsVC = [PKDetailViewController new];
    [self.navigationController pushViewController:pkdetailsVC animated:YES];
    
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
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MSW, MSH-44-64) style:UITableViewStylePlain];
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
