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
@interface LinkViewController ()
@property beginAnimationV *benginV;
@property UIButton *connect;
@property UIImageView *droneImageV_normal;

@property ZYTshapeLayer *connectLine;
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

-(void)removeTheAnimationView{
    [UIView animateWithDuration:1 delay:3.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        self.benginV.alpha = 0;
    } completion:^(BOOL finished) {
        NSLog(@"finish");
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
        make.top.mas_equalTo(self.view).offset(200);
        make.height.mas_equalTo(150);
    }];
}
-(void)connectButton{
    self.connect = [[UIButton alloc]init];
    [self.connect setTitle:@"搜 索 飞 机" forState:UIControlStateNormal];
    [self.connect setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.connect];
    [self.connect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.droneImageV_normal.mas_bottom).offset(100);
        make.left.and.centerX.equalTo(self.droneImageV_normal);
        make.height.mas_equalTo(50);
    }];
    self.connect.layer.borderColor = [UIColor blackColor].CGColor;
    self.connect.layer.borderWidth = 1.f;
    self.connect.layer.cornerRadius = 3;
    [self.connect addTarget:self action:@selector(connectWithDrone:) forControlEvents:UIControlEventTouchDown];
    [self.connect addTarget:self action:@selector(disConnectWithDrone:) forControlEvents:UIControlEventTouchUpInside];
    
    self.connectLine = [ZYTshapeLayer layer];
    [self.connectLine drawLineFrom:self.view.frame.size.width/2 and:450 To:self.view.frame.size.width/2 and:350-65];
    [self.view.layer addSublayer:self.connectLine];
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
    }else{
        [self.timer1 invalidate];
        [self.navigationController pushViewController:self.operavc animated:YES];
        
//        [self presentViewController:self.operavc animated:YES completion:^{
//        }];
        self.connectLine.strokeEnd=0;
    }
    
}
-(void)connectLineShrink{
    if (self.connectLine.strokeEnd>0) {
        self.connectLine.strokeEnd-=0.1;
    }
    
}

@end
