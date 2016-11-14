//
//  PKListModel.h
//  myg
//
//  Created by Apple on 16/11/2.
//  Copyright © 2016年 bxs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PKListModel : NSObject

//{
//    id = 1;
//    money = 60;
//    qishu = 1;
//    thumb = "http://192.168.1.188/statics/uploads/photo/goods.jpg";
//    title = "\U79fb\U52a8\U5145\U503c\U5361100\U5143";
//}
/** id */
@property (nonatomic,assign)NSInteger id;
/** money */
@property (nonatomic,strong)NSString *money;
/** qishu */
@property (nonatomic,strong)NSString *qishu;
/** thumb */
@property (nonatomic,strong)NSString *thumb;
/** title */
@property (nonatomic,strong)NSString *title;

@end
