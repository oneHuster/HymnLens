//
//  CAShapeLayer+init.h
//  HymnLens
//
//  Created by 邹应天 on 16/2/16.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (init)
+(CAShapeLayer*)initializeWithFrame:(CGRect)rect;
-(void)addShadows;
@end
