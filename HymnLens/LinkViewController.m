//
//  LinkViewController.m
//  HymnLens
//
//  Created by 陈志浩 on 16/1/28.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "LinkViewController.h"
#import "beginAnimationV.h"
#import "OperateVC.h"
#import "PressAnimationButton.h"

@interface LinkViewController ()<PressAnimationButtonDelegate>
@property beginAnimationV *benginV;
@property UIButton *connect;

@property PressAnimationButton *button;
@property UIImageView *droneImageV_normal;

@property ZYTshapeLayer *connectLine;
@property ZYTshapeLayer *connectLine2;
@property ZYTshapeLayer *connectLine3;

@property BOOL connecting;
@property OperateVC *operavc;
@property NSTimer *timer1;
@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self DroneImage];
    [self connectButton];
    self.benginV = [[beginAnimationV alloc]initWithFrame:self.view.frame];
    [self.view addSubview: self.benginV];
    [self initWithTimer];
    [self removeTheAnimationView];
    self.operavc = [[OperateVC alloc]init];
   
   

}
-(void)initWithTimer{
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animationProcess:) userInfo:nil repeats:YES];
}
-(void)animationProcess:(NSTimer*)timer{
    [self.benginV customeAnimationPoccess];
}

-(void)removeTheAnimationView
{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    //self.benginV.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateWithDuration:3 delay:3.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
       // self.benginV.transform = CGAffineTransformMakeScale(1.5, 1.5);
        self.benginV.alpha = 0;
    } completion:^(BOOL finished) {
        NSLog(@"finish");
        self.navigationController.navigationBar.hidden = NO;
        self.tabBarController.tabBar.hidden = NO;
        [self.benginV removeFromSuperview];
        [self.timer1 invalidate];
    }];

}
-(void)DroneImage{
    self.droneImageV_normal = [UIImageView new];
    [self.view addSubview:self.droneImageV_normal];
    self.droneImageV_normal.image = [UIImage imageNamed:@"photo_drone.png"];
    self.droneImageV_normal.contentMode = UIViewContentModeScaleToFill;
    [self.droneImageV_normal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).offset(100);
        make.bottom.mas_equalTo(self.view.mas_centerY).offset(-50);
        make.height.mas_equalTo(150);
    }];
}
-(void)connectButton{
    self.button          = [[PressAnimationButton alloc] initWithFrame:CGRectMake(VC_WIDTH/2 - 140, VC_HEIGHT/2 +50, 280, 50)];
//    self.button.font     = [UIFont HeitiSCWithFontSize:14.f];
    self.button.delegate = self;
//
    self.button.normalTextColor    = [UIColor blackColor];
    self.button.highlightTextColor = [UIColor whiteColor];
    self.button.animationColor     = [UIColor blackColor];
//
    self.button.layer.borderWidth  = 1.f;
    self.button.animationWidth     = 200;
    self.button.text               = @"connect drone";
//
    //self.button.center = self.view.center;
    [self.view addSubview: self.button];

    
    
//    self.connect = [[UIButton alloc]init];
//    [self.connect setTitle:@"搜 索 飞 机" forState:UIControlStateNormal];
//    [self.connect setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.view addSubview:self.connect];
//    [self.connect mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.droneImageV_normal.mas_bottom).offset(100);
        //make.left.and.centerX.equalTo(self.droneImageV_normal);
        //make.height.mas_equalTo(50);
//    }];
//    self.connect.layer.borderColor = [UIColor blackColor].CGColor;
//    self.connect.layer.borderWidth = 1.f;
//    self.connect.layer.cornerRadius = 3;
//    [self.button addTarget:self action:@selector(connectWithDrone:) forControlEvents:UIControlEventTouchDown];
//    [self.button addTarget:self action:@selector(disConnectWithDrone:) forControlEvents:UIControlEventTouchUpInside];
    
    self.connectLine = [ZYTshapeLayer layer];
    
    [self.connectLine drawLineFrom:VC_WIDTH/2 and:VC_HEIGHT/2 +50 To:VC_WIDTH/2 and:VC_HEIGHT/2 -50 -60];
    self.connectLine.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:self.connectLine];
    
    
    self.connectLine2 = [ZYTshapeLayer layer];
    [self.connectLine2 drawLineFrom:VC_WIDTH/2 - 10 and:VC_HEIGHT/2 +50 To:VC_WIDTH/2 - 10 and:VC_HEIGHT/2 - 50 - 30];
    self.connectLine2.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:self.connectLine2];
    
    self.connectLine3  = [ZYTshapeLayer layer];
    [self.connectLine3 drawLineFrom:VC_WIDTH/2 +10 and:VC_HEIGHT /2 +50 To:VC_WIDTH/2 +10 and:VC_HEIGHT/2 - 50];
    self.connectLine3.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:self.connectLine3];
}
#pragma mark  --------------------------button delegate
-(void)touchDownByPressAnimationButton:(PressAnimationButton *)button{
    [self connectWithDrone:nil];
}

-(void)touchUpInsideByPressAnimationButton:(PressAnimationButton *)button{
    [self disConnectWithDrone:nil];
}
-(void)finishedEventByPressAnimationButton:(PressAnimationButton *)button{
    [self.timer1 invalidate];
    [self.navigationController pushViewController:self.operavc animated:YES];

}


-(void)connectWithDrone:(UIButton*)conButton{
    [self.timer1 invalidate];
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(connectLineAdd) userInfo:nil repeats:YES];
}
-(void)disConnectWithDrone:(UIButton*)button{
    [self.timer1 invalidate];
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(connectLineShrink) userInfo:nil repeats:YES];

}

-(void)connectLineAdd{
    if (self.connectLine.strokeEnd<1) {
        self.connectLine.strokeEnd+=0.1;
        self.connectLine2.strokeEnd += 0.1;
        self.connectLine3.strokeEnd += 0.1;
    }else{
//        [self.timer1 invalidate];
//        [self.navigationController pushViewController:self.operavc animated:YES];
        
        self.connectLine.strokeEnd=0;
    }
    
}
-(void)connectLineShrink{
    if (self.connectLine.strokeEnd>0) {
        self.connectLine.strokeEnd-=0.1;
        self.connectLine2.strokeEnd -= 0.1;
        self.connectLine3.strokeEnd -= 0.1;
    }
    
}

@end
