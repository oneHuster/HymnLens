//
//  beginAnimation.m
//  HymnLens
//
//  Created by 邹应天 on 16/1/29.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "beginAnimationV.h"
#import "FBShimmeringLayer.h"
#import "FBShimmeringView.h"
#import "CAShapeLayer+init.h"
#import "StrokeCircleLayerConfigure.h"

#define frameH self.frame.size.height
#define frameW self.frame.size.width
@interface beginAnimationV()
@property (nonatomic, strong) UIView   *contentView;

@end

@implementation beginAnimationV
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
       //    self.backgroundColor=[UIColor clearColor];
    self.contentMode = UIViewContentModeScaleAspectFill;
    [self imageviewAnimation];
    self.alpha = 1;
    [self loadEmitterLayer];
    [self initWithShimmeringView];
    [self.layer setNeedsDisplay];
    
    return self;
}
-(void)imageviewAnimation{
    UIImageView *backGroundV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"172699.png"]];
    backGroundV.alpha = 0;
    backGroundV.frame = self.bounds;
    [UIView animateWithDuration:1 animations:^{
        backGroundV.alpha = 1;
    }];
    [self addSubview:backGroundV];
}
-(void)loadEmitterLayer{
    //     CAEmitterLayer *propellerEmitter = [CAEmitterLayer layer];
    //    propellerEmitter.emitterPosition = CGPointMake(frameW, frameH);
    //    //propellerEmitter.emitterSize  = CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    //    // Spawn points for the flakes are within on the outline of the line
    //    propellerEmitter.emitterMode		= kCAEmitterLayerOutline;
    //    propellerEmitter.emitterShape	= kCAEmitterLayerCircle;
    //    CAEmitterCell *propellerFlake = [CAEmitterCell emitterCell];
    //
    //    propellerFlake.birthRate		= 1.0;
    //    propellerFlake.lifetime		= 30.0;
    //    propellerFlake.spinRange    = 100;
    //    propellerFlake.velocity		= -10;				// falling down slowly
    //    propellerFlake.velocityRange = 10;
    ////    snowflake.yAcceleration = 4;
    ////    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    ////    snowflake.spinRange		= 0.5*M_PI;		// slow spin
    ////    snowflake.alphaRange    = 1;
    ////    snowflake.alphaSpeed    =-0.06;
    //    propellerFlake.contents		= (id) [[UIImage imageNamed:@"triangle1.png"] CGImage];
    //
    //     propellerEmitter.emitterCells = [NSArray arrayWithObject:propellerFlake];
    //    [self.layer addSublayer:propellerEmitter];
    
    
    CAEmitterLayer *propellerEmitter2 = [CAEmitterLayer layer];
    propellerEmitter2.emitterPosition = CGPointMake(-40, -40);
    propellerEmitter2.emitterMode    = kCAEmitterLayerSurface;
    propellerEmitter2.emitterShape	= kCAEmitterLayerCircle;
    propellerEmitter2.emitterSize  = CGSizeMake(80, 80);
    CAEmitterCell *propellerFlake2 = [CAEmitterCell emitterCell];
    propellerFlake2.birthRate		=  0.5;
    propellerFlake2.lifetime		=  50.0;
    propellerFlake2.emissionLongitude =  M_PI / 3;
    propellerFlake2.emissionRange = M_PI / 4;
    propellerFlake2.spin   =   5;
    propellerFlake2.spinRange    = 5;
    propellerFlake2.velocity	= 70;				// falling down slowly
    propellerFlake2.velocityRange = 10;
    //    propellerFlake2.alphaRange    =  0.5;
    propellerFlake2.alphaSpeed = - 0.055;
    propellerFlake2.contents		= (id) [[UIImage imageNamed:@"rectwhite.png"] CGImage];
    propellerEmitter2.opacity =     1.0;
    propellerFlake2.scale    =      0.4;
    propellerFlake2.scaleRange  =   0.3;
    propellerEmitter2.emitterCells = [NSArray arrayWithObject:propellerFlake2];
    [self.layer addSublayer:propellerEmitter2];
    
    
}

-(void)initWithShimmeringView{
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.bounds];
    shimmeringView.shimmering                  = YES;
    shimmeringView.shimmeringBeginFadeDuration = 0.3;
    shimmeringView.shimmeringOpacity           = 0.8;
    [self addSubview:shimmeringView];
    
    UILabel *logoLabel         = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
    logoLabel.text             = @"HymnLens";
    logoLabel.font             = [UIFont fontWithName:@"Menlo" size:40.0];
    logoLabel.textColor        = [UIColor whiteColor];
    logoLabel.textAlignment    = NSTextAlignmentCenter;
    logoLabel.backgroundColor  = [UIColor clearColor];
    shimmeringView.contentView = logoLabel;
    //⭕️
    //    {
    //        FBShimmeringLayer *shimmeringLayer          = [FBShimmeringLayer layer];
    //        shimmeringLayer.frame                       = (CGRect){CGPointZero, CGSizeMake((130 + 1) * 2, (130 + 1) * 2)};
    //        shimmeringLayer.position                    = self.center;
    //        shimmeringLayer.shimmering                  = YES;
    //        shimmeringLayer.shimmeringBeginFadeDuration = 0.3;
    //        shimmeringLayer.shimmeringOpacity           = 0.3;
    //        shimmeringLayer.shimmeringPauseDuration     = 0.6f;
    //        [self.layer addSublayer:shimmeringLayer];
    //
    //        CAShapeLayer *circleShape          = [CAShapeLayer layer];
    //
    //        StrokeCircleLayerConfigure *config = [StrokeCircleLayerConfigure new];
    //        config.lineWidth                   = 1.f;
    //        config.startAngle                  = 0;
    //        config.endAngle                    = M_PI * 2;
    //        config.radius                      = 130.f;
    //        config.strokeColor                 = [UIColor redColor];
    //        [config configCAShapeLayer:circleShape];
    //
    //        shimmeringLayer.contentLayer = circleShape;
    //    }
    
    
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    ctx = UIGraphicsGetCurrentContext();
    
    
    self.line1 = [ZYTshapeLayer layer];
    [self.line1 drawLineFrom:0 and:frameH/2-100 To:frameW and:frameH/2-100];
    [self.line1 addShadows];
    [self.layer addSublayer:self.line1];
    
    
    self.line2 = [ZYTshapeLayer layer];
    [self.line2 drawLineFrom:frameW and:frameH/2+100 To:0 and:frameH/2+100];
    [self.line2 addShadows];
    [layer addSublayer:self.line2];
    
    self.H_line1 = [ZYTshapeLayer layer];
    [self.H_line1 drawLineFrom:frameW/2 and:frameH/2-150 To:frameW/2-50 and:frameH/2+50 ];
    // [layer addSublayer:self.H_line1];
    
    self.H_line2 = [ZYTshapeLayer layer];
    [self.H_line2 drawLineFrom:frameW/2-75 and:frameH/2+10 To:frameW/2-15 and:frameH/2+10];
    //[layer addSublayer:self.H_line2];
    
    self.H_line3 = [ZYTshapeLayer layer];
    [self.H_line3 drawLineFrom:frameW/2+10 and:frameH/2-105 To:frameW/2-40 and:frameH/2+95];
    // [layer addSublayer:self.H_line3];
}
-(void)customeAnimationPoccess{
    
    if (self.line1.strokeEnd>2) {
        self.line1.strokeStart+=0.1;
        self.line2.strokeStart+=0.1;
        
    }else{
        self.line1.strokeEnd+=0.1;
        self.line2.strokeEnd+=0.1;
    }
//    if (self.H_line1.strokeEnd<1) {
//        self.H_line1.strokeEnd+=0.1;
//        self.H_line2.strokeEnd+=0.1;
//        self.H_line3.strokeEnd+=0.1;
//    }
//    else if(self.H_line1.strokeStart<0.5){
//        self.H_line1.strokeStart += 0.1;
//        self.H_line2.strokeStart += 0.1;
//        self.H_line3.strokeStart += 0.1;
//    }
}

@end
