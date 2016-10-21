//
//  PeopleTimeView.m
//  myg
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PeopleTimeView.h"

@interface PeopleTimeView ()
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UITextField *sumText;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *firstTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *secendTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *tailTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *settleBtn;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;

@end

@implementation PeopleTimeView

- (IBAction)settleAction:(id)sender {
}

- (void)awakeFromNib{
    [super awakeFromNib];
}


@end
