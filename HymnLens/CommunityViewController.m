//
//  CommunityViewController.m
//  HymnLens
//
//  Created by 陈志浩 on 16/1/28.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "CommunityViewController.h"
#import "communityCell.h"
#import "CAShapeLayer+init.h"
#import "communityDetailVC.h"
#import "UIImageView+BlurAnimation.h"


@interface CommunityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property UITableView *tableView;
@property UIImageView *headV;

@property NSTimer *timer;
@property CAShapeLayer *shapelayer;
@property CAShapeLayer *nameline;
@property UILabel *username;
@property UIButton *favicon;
@property communityDetailVC *detailVC;

//@property GPUImageGaussianBlurFilter *gaussianFilter;
//@property UIImage *headImage;
@property UIImage *blurredImage;
//@property gpuimage
@end

static NSString *cellIdentifier = @"cell";


@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.detailVC = [[communityDetailVC alloc]init];
    [self initWithTableView];
    [self initWithFavicon];
    [self createTheAnimationOfFaivicon];
    [self initWithUsername];
    
}
-(void)viewWillAppear:(BOOL)animated{
      self.navigationController.navigationBarHidden = YES;
}
-(void)createTheAnimationOfFaivicon{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(drawFaviconLine) userInfo:nil repeats:YES];
    self.shapelayer = [CAShapeLayer initializeWithFrame:CGRectMake(0, 0, 100, 100)];
    self.shapelayer.position = CGPointMake(80, 70);
    [self.headV.layer addSublayer:self.shapelayer];
    
    self.nameline = [CAShapeLayer layer];
    self.nameline.lineWidth=1.f;
    self.nameline.strokeColor= [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.6].CGColor;
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, 150,60);
    CGPathAddLineToPoint(pathRef, NULL, 240, 60);
    self.nameline.path=pathRef;
    self.nameline.strokeStart = 0;
    self.nameline.strokeEnd=0.125;
    [self.headV.layer addSublayer:self.nameline];
}

-(void)drawFaviconLine{
    self.favicon.alpha += 0.1;
    self.shapelayer.strokeEnd += 0.1;
    self.nameline.strokeEnd += 0.1;
    //[self blurProcess:_gaussianFilter.blurRadiusInPixels+=1.5];
    if (self.shapelayer.strokeEnd>1) {
        [self.timer invalidate];
    }
}

-(void)initWithFavicon{
    self.favicon = [[UIButton alloc]initWithFrame:CGRectMake(30.5, 20.5, 99, 99)];
    self.favicon.layer.cornerRadius = 50;
    self.favicon.clipsToBounds = YES;
    self.favicon.alpha = 0;
    [self.favicon setImage:[UIImage imageNamed:@"gentleman.png"] forState:UIControlStateNormal];
    
    //缩放有点问题
    //CGAffineTransform t =  CGAffineTransformMakeScale(0.3, 0.3);
    self.favicon.imageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    [UIView animateWithDuration:0.875 animations:^{
        self.favicon.imageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    }];
    [self.favicon addTarget:self action:@selector(pushToTheAdminVC) forControlEvents:UIControlEventTouchDown];

    self.favicon.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.headV addSubview:self.favicon];
}
-(void)initWithUsername{
    self.username = [UILabel new];
    self.username.text = @"Mr.ray";
    [self.headV addSubview:self.username];
    [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headV).offset(35);
        make.left.mas_equalTo(self.headV).offset(150);
    }];
}


-(void)pushToTheAdminVC{
    [self.navigationController pushViewController:self.detailVC animated:YES];
}
#pragma  mark -----------------------------tableview
-(void)initWithTableView{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self initWithHeadView];
    self.tableView.tableHeaderView = self.headV;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[communityCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:self.tableView];
}
-(void)initWithHeadView{
    self.headV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VC_WIDTH, 140)];
    [self blurProcess];
    
}

-(void)blurProcess{
    UIImage *sourceImage = [UIImage imageNamed:@"head_BG.jpg"];
    self.headV.image = sourceImage;
    self.headV.userInteractionEnabled = YES;
    //模糊颜色
    //self.headV.blurTintColor = [UIColor colorWithWhite:0.4f alpha:0.3f];
    self.headV.blurRadius = 40;
    //动画重复次数，0是一直。
    self.headV.animationRepeatCount = 1;
    [self.headV ty_blurInAnimationWithDuration:3.f];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    communityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    cell.textLabel.text = @"来自大疆无人机";
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
//展示cell动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.alpha = 0;
    cell.contentView.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateWithDuration:1 delay:indexPath.row*0.4 options:UIViewAnimationOptionCurveEaseIn animations:^{
        cell.alpha = 1;
        cell.contentView.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        
    }];
}
@end
