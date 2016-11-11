//
//  PKGoSettleViewController.m
//  myg
//
//  Created by Apple on 16/11/8.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKGoSettleViewController.h"
#import "PKSettleView.h"
#import "SettlementViewController.h"
@interface PKGoSettleViewController ()

@property (nonatomic,strong)PKSettleView *pksettleView;
@property (nonatomic,assign)BOOL isKeyboardVisible;


@property(nonatomic,strong)NSMutableArray *classArray;  //支付方式
@property(nonatomic,strong)NSMutableArray *zhifuNameArray; //支付名
@property(nonatomic,strong)NSMutableArray *zhifuTishiArray; //支付小标题
@property(nonatomic,strong)NSMutableArray *zhifuColorArray; //支付颜色
@property(nonatomic,strong)NSMutableArray *zhifuImgArray; //支付图片
@end

@implementation PKGoSettleViewController
{
    int _isback;//是否从结算返回
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
    
    [self setInit];
}
- (void)setInit{
    
    self.classArray=[NSMutableArray array];
    self.zhifuNameArray=[NSMutableArray array];
    self.zhifuColorArray=[NSMutableArray array];
    self.zhifuImgArray=[NSMutableArray array];
    self.zhifuTishiArray=[NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)setUpUI{
    
//    self.navigationController.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    [self.view addSubview:self.pksettleView];
    
    [self keyboardNotification];
    
}
- (PKSettleView *)pksettleView{
    if (!_pksettleView) {
        self.pksettleView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PKSettleView class]) owner:nil options:nil].lastObject;
        self.pksettleView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 300);
        
    }
    return _pksettleView;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGRect frame = self.pksettleView.frame;
    frame.origin.y = self.view.bounds.size.height - 300;
    [UIView animateWithDuration:0.2 animations:^{
        self.pksettleView.frame = frame;
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (_isKeyboardVisible) {
        [self.view endEditing:YES];
    }else{
        
        
        if (![[touches anyObject].view isKindOfClass:[self.pksettleView class]]) {
            CGRect frame = self.pksettleView.frame;
            frame.origin.y = self.view.bounds.size.height;
            [UIView animateWithDuration:0.3 animations:^{
                self.pksettleView.frame = frame;
            }];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:nil];
            });
            
        }
    }
    DebugLog(@"%@",[touches anyObject].view);
    
}
/**
 *键盘收起与弹出
 */
- (void)keyboardNotification{
    DebugLog(@"aaa");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardWillHideNotification object:nil];
}
/**
 *弹出
 */
- (void)keyboardShow{
    DebugLog(@"keyboard will show");
    
    
    if (_isKeyboardVisible) {
        return;
    }else{
        CGRect frame =  self.pksettleView.frame;
        frame.origin.y = self.pksettleView.frame.origin.y - 100;
        DebugLog(@"%f",self.pksettleView.frame.origin.x);
        [UIView animateWithDuration:0.3 animations:^{
            DebugLog(@"%f",self.pksettleView.frame.origin.x);
            self.pksettleView.frame = frame;
            DebugLog(@"%f",self.pksettleView.frame.origin.x);
        }];
        _isKeyboardVisible = YES;
    }
}
/**
 *隐藏
 */
- (void)keyboardHide{
    _isKeyboardVisible = NO;
    DebugLog(@"keyboard will hide");
    CGRect frame =  self.pksettleView.frame;
    frame.origin.y = MSH - self.pksettleView.frame.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        self.pksettleView.frame = frame;
    }];
}

#pragma mark <结算>
- (void)settlement
{
    __block NSString *settlementString;
    NSMutableArray *settlementArray = [NSMutableArray array]; //结算array
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    if ([UserDataSingleton userInformation].isLogin == YES)
    {
        //解析数据对象
        settlementString =  [NSString stringWithFormat:@"{\"shopid\":%@,\"number\":%ld}",[UserDataSingleton userInformation].shopModel.goodsId,(long)[UserDataSingleton userInformation].shopModel.num];
        NSString *string = [NSString stringWithFormat:@"[%@]",settlementString];
        DebugLog(@"!!!!!!!!!!!解析%@",string);
        //        [{"shopid":10125,"number":10}]
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:[UserDataSingleton userInformation].uid forKey:@"yhid"];
        [dict setValue:[UserDataSingleton userInformation].code forKey:@"code"];
        [dict setValue:string forKey:@"cart"];
        [dict setValue:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] forKey:@"ver"];
        [MDYAFHelp AFPostHost:APPHost bindPath:xinjiesuan postParam:dict getParam:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseDic) {
            DebugLog(@"====%@ ====%@",responseDic,responseDic[@"msg"]);
            if ([responseDic[@"code"] isEqualToString:@"302"])
            {
                [SVProgressHUD showErrorWithStatus:@"请登录"];
                
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                loginVC.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:loginVC animated:YES];
            }
            if ([responseDic[@"code"]isEqualToString:@"400"])
            {
                [SVProgressHUD showErrorWithStatus:responseDic[@"msg"]];
            }
            if ([responseDic[@"code"] isEqualToString:@"200"])
            {
                [SVProgressHUD dismiss];
                
                [self.classArray removeAllObjects];
                [self.zhifuNameArray removeAllObjects];
                [self.zhifuTishiArray removeAllObjects];
                [self.zhifuColorArray removeAllObjects];
                [self.zhifuImgArray removeAllObjects];
                
                NSDictionary *dict = responseDic[@"data"];
                SettlementModel *model = [[SettlementModel alloc]initWithDictionary:dict];
                if ([[UserDataSingleton userInformation].currentVersion isEqualToString:[UserDataSingleton userInformation].xinVersion]) {
                    for (int i=0; i<model.pay_type.count; i++) {
                        NSDictionary*dic1=[model.pay_type objectAtIndex:i];
                        [self.classArray addObject:dic1[@"pay_class"]];
                        [self.zhifuNameArray addObject:dic1[@"pay_name"]];
                        [self.zhifuTishiArray addObject:dic1[@"tishi"]];
                        [self.zhifuColorArray addObject:dic1[@"color"]];
                        [self.zhifuImgArray addObject:dic1[@"img"]];
                        //
                        DebugLog(@"---->%@",self.classArray);
                        DebugLog(@"++++>%@",self.zhifuNameArray);
                    }
                    
                }else{
                    
                    
                    //                    wapalipayhttp://www.miyungou.com/statics/uploads/pay/alipay.png
                    [self.classArray addObject:@"wapalipay"];
                    [self.zhifuNameArray addObject:@"支付宝网页支付"];
                    [self.zhifuTishiArray addObject:@"推荐5元以上支付的用户使用"];
                    [self.zhifuImgArray addObject:@"http://www.miyungou.com/statics/uploads/pay/alipay.png"];
                    [self.zhifuColorArray addObject:@"#FF0000"];
                    
                }
                
                
                SettlementViewController *settVC = [[SettlementViewController alloc]init];
                settVC.settModel = model;
                settVC.goods = string;
                settVC.totalYue = [NSString stringWithFormat:@"%@",dict[@"totalYue"]];
                settVC.classArray=self.classArray;
                settVC.zhifuNameArray=self.zhifuNameArray;
                settVC.zhifuTishiArray=self.zhifuTishiArray;
                settVC.zhifuColorArray=self.zhifuColorArray;
                settVC.zhifuImgArray=self.zhifuImgArray;
                
                [self.navigationController pushViewController:settVC animated:YES];
                _isback=1;
                
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"请检查您的网络"];
            [settlementArray removeAllObjects];
            DebugLog(@"%@",error);
            NSData *data = [operation responseData];
            NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            DebugLog(@"请求下来的数据%@",str);
        }];
    }
    else
    {
        [SVProgressHUD dismiss];
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        loginVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    
}





@end
