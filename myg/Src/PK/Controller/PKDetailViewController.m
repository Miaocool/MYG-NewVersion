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

@interface PKDetailViewController ()<UITableViewDelegate,UITableViewDataSource,PKDetailsCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
@end

static NSString *const cellID1 = @"PKDetailsCell";

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
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PKDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
    cell.delegate = self;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.height;
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
@end
