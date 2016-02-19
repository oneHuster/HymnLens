//
//  CAShapeLayer+init.m
//  HymnLens
//
//  Created by 邹应天 on 16/2/16.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "CAShapeLayer+init.h"

@implementation CAShapeLayer (init)
+(CAShapeLayer*)initializeWithFrame:(CGRect)rect{
    CAShapeLayer *shape = [[CAShapeLayer alloc]init];
    shape.bounds=rect;
    
    //self.position=CGPointMake(110, 425);
    shape.fillColor=[UIColor clearColor].CGColor;
    shape.lineWidth=1.f;
    shape.strokeColor=[UIColor grayColor].CGColor;
    UIBezierPath *circlePath=[UIBezierPath bezierPathWithOvalInRect:rect];
    shape.path=circlePath.CGPath;
    shape.strokeStart = 0.125;
    shape.strokeEnd = 0.175;
    return shape;
}
@end
