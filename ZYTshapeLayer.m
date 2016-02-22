//
//  ZYTshapeLayer.m
//  HymnLens
//
//  Created by 邹应天 on 16/1/29.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "ZYTshapeLayer.h"

@implementation ZYTshapeLayer
-(void)drawLineFrom:(float)X1 and:(float)Y1 To:(float)X2 and:(float)Y2{
    self.lineWidth = 1.5f;
    self.strokeColor= [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.6].CGColor;
    self.strokeColor = [UIColor whiteColor].CGColor;
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, X1,Y1);
    CGPathAddLineToPoint(pathRef, NULL, X2,Y2);
    self.path=pathRef;
    self.strokeStart = 0;
    self.strokeEnd=0;
    //[layer addSublayer:self.line1];
}
@end
