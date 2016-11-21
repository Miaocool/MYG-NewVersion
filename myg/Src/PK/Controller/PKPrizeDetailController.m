//
//  PKPrizeDetailController.m
//  myg
//
//  Created by Apple on 16/11/21.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPrizeDetailController.h"
#import "PKPrizeStateCell.h"
#import "PKPrizeMessageCell.h"
#import "PKPrizeAccountMessageCell.h"
@interface PKPrizeDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end
static NSString *const cellStateID = @"PKPrizeStateCell";
static NSString *const cellAccountID = @"PKPrizeAccountMessageCell";
static NSString *const cellMessageID = @"PKPrizeMessageCell";
@implementation PKPrizeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpUI];
    
    
    
}
- (void)setUpUI{
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPrizeStateCell class]) bundle:nil] forCellReuseIdentifier:cellStateID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPrizeAccountMessageCell class]) bundle:nil] forCellReuseIdentifier:cellAccountID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PKPrizeMessageCell class]) bundle:nil] forCellReuseIdentifier:cellMessageID];
}
#pragma mark <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        PKPrizeStateCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStateID forIndexPath:indexPath];
        return cell;
        
    }else if (indexPath.section == 1){
        PKPrizeAccountMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellAccountID forIndexPath:indexPath];
        return cell;
    }else{
        PKPrizeMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMessageID forIndexPath:indexPath];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 40;
    }else if (indexPath.section == 1){
        return 75;
    }else{
        return 120;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        UIView *backView = [self setHeadViewWith:@"奖品状态"];
        return backView;
    }else if (section == 1){
        UIView *backView = [self setHeadViewWith:@"卡号卡密"];
        return backView;
    }else{
        UIView *backView = [self setHeadViewWith:@"商品信息"];
        return backView;
    }
}
- (UIView *)setHeadViewWith:(NSString *)text{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.view.width, 38)];
    stateLabel.text = text;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, 38, self.view.width - 10, 2)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    backView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:stateLabel];
    [backView addSubview:lineView];
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 0;
    }else{
        return 15;
    }
}
- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64) style:UITableViewStyleGrouped];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
