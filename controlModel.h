//
//  controlModel.h
//  HymnLens
//
//  Created by 邹应天 on 16/2/22.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface controlModel : NSObject

@property NSString *pitch;
@property NSString *roll;//横滚
@property NSString *yaw;//偏航
@property NSString *altitude;//高度
@property NSString *battery;//电量

@end
