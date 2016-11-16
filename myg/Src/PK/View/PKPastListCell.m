//
//  PKPastListCell.m
//  myg
//
//  Created by Apple on 16/11/9.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKPastListCell.h"

@interface PKPastListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *ballTypeIMG;

@end



@implementation PKPastListCell



- (void)setModel:(PKDetailsBallListModel *)model{
    _model = model;
    if ([model.ball_type isEqualToString:@"0"]) {
        self.ballTypeIMG.image = [UIImage imageNamed:@"dahongqiu"];
    }else{
        self.ballTypeIMG.image = [UIImage imageNamed:@"dalanqiu"];
    }
    
    
}

@end
