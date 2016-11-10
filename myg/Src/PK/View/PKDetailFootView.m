//
//  PKDetailFootView.m
//  myg
//
//  Created by Apple on 16/11/10.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import "PKDetailFootView.h"

@implementation PKDetailFootView


- (void)layoutSubviews{
    [super layoutSubviews];
    self.height = 55;
    
    DebugLog(@"-- subviews --: %f",self.height);
}
@end
