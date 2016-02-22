//
//  UIView+FlipTransition.h
//  Bignote
//
//  Created by 邹应天 on 15/11/8.
//  Copyright (c) 2015年 邹应天. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (UIView_FlipTransition)

+ (void)flipTransitionFromView:(UIView *)firstView toView:(UIView *)secondView duration:(float)aDuration completion:(void (^)(BOOL finished))completion;


+(void)foldingAnimationWithPulledDistance:(float)pulled ;
@end
