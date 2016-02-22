//
//  OperateVC.m
//  HymnLens
//
//  Created by 邹应天 on 16/1/29.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "OperateVC.h"
#import "GCDAsyncUdpSocket.h"
#import <SpriteKit/SpriteKit.h>
#import "joystick_Scene.h"
@interface OperateVC ()
@property UIWebView *webView;
@property GCDAsyncUdpSocket *udpSocket;

@property SKLabelNode *altitude;
@property SKLabelNode *angle;
@property SKLabelNode *roll;
@property SKLabelNode *pitch;
@property SKLabelNode *yaw;
@property SKLabelNode *powerty;

@property UIImageView *batteryIcon;//🔋
@property UIImageView *rollIcon;//横滚
@property UIImageView *yawIcon;//偏航
@property UIImageView *pitchIcon;//俯仰
@property UIImageView *altitudeIcon;//高度
//@property UILabel *GPS_longitude;//经度
//@property UILabel *GPS_latitude;//纬度
@property UIView *statusV;

@property SKVideoNode *skplayer;

@end

static NSString *movieURLstring = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";

@implementation OperateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =V_COLOR;
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden =YES;
    //设置横屏坐标系横置。
    self.view.bounds = [UIScreen mainScreen].bounds;
    
    [self initWithStatusBar];
    [self initWithJoystick];
    
}
//纯代码修改view为skview
-(void)loadView{
    self.view = [[SKView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}
//-(void)initWithSKAVplayer{
//    
//}
-(void)initWithAVplayer{
    NSURL *url = [NSURL URLWithString:movieURLstring];
    AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:url options:nil];
    //播放
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//    playerLayer.frame = self.view.layer.bounds;
//    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
//    [self.view.layer addSublayer:playerLayer];

    //[player play];
    self.skplayer = [SKVideoNode videoNodeWithURL:url];
    self.skplayer.anchorPoint = CGPointMake(0.5,0.5);
    self.skplayer.size = self.view.bounds.size;
   
    

}



-(void)initWithJoystick
{
//    self.displayV =  [[SKView alloc]initWithFrame:self.view.bounds];
//    self.displayV.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:self.displayV];
    SKView *spriteView = (SKView *)self.view;
    spriteView.ignoresSiblingOrder = YES;
    spriteView.showsFPS = YES;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    //CGSize tempsize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.width) ;
    CGSize tempsize = self.view.layer.bounds.size;
    joystick_Scene *hello = [[joystick_Scene alloc] initWithSize:tempsize];
   // [hello addChild:self.skplayer];
    //[self.skplayer play];
    [spriteView presentScene: hello];

}

#pragma mark -----------------------------UDP
-(void)initWithUdpSocket{
    dispatch_queue_t udpSocketQueue=dispatch_queue_create("com.manmanlai.updSocketQueue", DISPATCH_QUEUE_CONCURRENT);
    self.udpSocket = [[GCDAsyncUdpSocket alloc]initWithDelegate:self delegateQueue:udpSocketQueue];
}
-(void)initWithStatusBar{
    self.statusV = [[UIView alloc]init];
    self.statusV.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
    [self.view addSubview:self.statusV];
    [self.statusV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    [self initWithBattery];
    [self initWithArguements];
}
-(void)initWithBattery{
    self.batteryIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"batteryhalf.png"]];
    //self.batteryIcon.tintColor = [UIColor whiteColor];
    [self.statusV addSubview:self.batteryIcon];
    [self.batteryIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.right.equalTo(self.statusV).offset(-60);
        make.centerY.equalTo(self.statusV);
        make.height.mas_equalTo(self.statusV).offset(-20);
    }];
}
-(void)initWithArguements{
    self.rollIcon  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"roll.png"]];
    [self.statusV addSubview: self.rollIcon];
    [self.rollIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.statusV);
        make.height.mas_equalTo(self.statusV).offset(-20);
        make.width.mas_equalTo(30);
        make.right.mas_equalTo(self.statusV).offset(-120-30);
    }];
    
    self.yawIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"angle.png"]];
    [self.statusV addSubview:self.yawIcon];
    [self.yawIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.statusV);
        make.height.mas_equalTo(self.statusV).offset(-20);
        make.width.mas_equalTo(30);
        make.right.mas_equalTo(self.statusV).offset(-180-30);
    }];
    
    self.pitchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pitch.png"]];
    [self.statusV addSubview:self.pitchIcon];
    [self.pitchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.statusV);
        make.height.mas_equalTo(self.statusV).offset(-20);
        make.width.mas_equalTo(30);
        make.right.mas_equalTo(self.statusV).offset(-240-30);
    }];
    
    
}
-(void)setTheOrientationLayout:(UIInterfaceOrientation)orientation{
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        
    }
}


@end
