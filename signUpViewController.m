//
//  signUpViewController.m
//  Bignote
//
//  Created by 邹应天 on 15/10/30.
//  Copyright (c) 2015年 邹应天. All rights reserved.
//

#import "signUpViewController.h"
#import "UIView+FlipTransition.h"
#import "loginView.h"
//#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface signUpViewController (){
    loginView *firstView;
    loginView *secondView;
}

@end

@implementation signUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBackground.jpg"]]];
    self.view.alpha=0.6;
    self.navigationController.navigationBar.hidden=YES;
    
    
    firstView=[[loginView alloc]init];
    secondView=[[loginView alloc]init];
    //firstView=[[UIView alloc]initWithFrame:self.view.frame];
//    self.warningLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 150, self.view.frame.size.width-60, 50)];
//    self.warningLabel.textColor=[UIColor redColor];
//    self.favicon=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    self.favicon.center=self.faviconCenter;
//    self.favicon.image=self.faviconImage;
    //头像图层
    CALayer *layer=[firstView.favicon layer];
    layer.cornerRadius=50;
    layer.masksToBounds=YES;
    
//    self.userName=[[UITextField alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 50)];
//    self.userName.backgroundColor=[UIColor whiteColor];
//    self.userName.placeholder=[NSString stringWithFormat:@"Admin"];
//    self.userName.layer.cornerRadius=5;
//    self.passWord=[[UITextField alloc] initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 50)];
//    self.passWord.backgroundColor=[UIColor whiteColor];
//    self.passWord.placeholder=[NSString stringWithFormat:@"Password"];
//    self.passWord.layer.cornerRadius=5;
//    self.passWord.secureTextEntry=YES;
    //self.passWord.delegate=self;
    firstView.passWord.delegate=self;
    
//    self.loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
//    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
//    [self.loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
//    [self.loginButton addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchDown];
//    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.loginButton.layer.cornerRadius=5;

    
    [self transformTextTransition];
    [firstView.layer addSublayer:layer];
    [firstView addSubview:firstView.warningLabel];
    [firstView addSubview:firstView.favicon];
    [self.view addSubview:firstView];
    [self RegisterViewInit];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
}
-(void)transformTextTransition{
    UIView *viewContainer=[[UIView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height-150)];
    
    [firstView.loginButton addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchDown];
    [viewContainer addSubview:firstView.userName];
    [viewContainer addSubview:firstView.loginButton];
    [viewContainer addSubview:firstView.passWord];
    [UIView animateWithDuration:1 animations:^{
        viewContainer.transform=CGAffineTransformMakeTranslation(0, -150);
        self.view.alpha=1;
    }];
    [firstView addSubview:viewContainer];
    // 注册button
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, SCREEN_HEIGHT-50, 80, 35)];
    [button addTarget:self action:@selector(toRegisterView) forControlEvents:UIControlEventTouchDown];
    button.titleLabel.text=@"注册账号";
    button.titleLabel.textColor=[UIColor blueColor];
    //设置下划线
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"注册账号"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [button setAttributedTitle:str forState:UIControlStateNormal];
    [firstView addSubview:button];
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 35)];
    [button2 addTarget:self action:@selector(toLoginView) forControlEvents:UIControlEventTouchDown];
    button2.titleLabel.text=@"已有账户 点此登录";
    button2.titleLabel.textAlignment=NSTextAlignmentCenter;
    button2.titleLabel.textColor=[UIColor whiteColor];
    //设置下划线
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:@"已有账户 点此登录"];
    NSRange strRange2 = {0,[str2 length]};
    [str2 addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange2];
    [button2 setAttributedTitle:str2 forState:UIControlStateNormal];
    [secondView addSubview:button2];
}
-(void)Login{
     [BmobUser loginInbackgroundWithAccount:firstView.userName.text andPassword:firstView.passWord.text block:^(BmobUser *user, NSError *error) {
         if (user==nil  && error==NULL) {
                         firstView.warningLabel.text=@"User name or password mistake!";
                     }
             
                     else if(error!=NULL){
                         firstView.warningLabel.text=[NSString stringWithFormat:@"%@",error];
                     }
                     else [self.navigationController popViewControllerAnimated:YES];
     }];
}

-(void)RegisterViewInit{

    secondView.hidden=YES;

    secondView.userName.center=CGPointMake(SCREEN_WIDTH/2, 80);
    secondView.passWord.center=CGPointMake(SCREEN_WIDTH/2, 160);
    secondView.nickname.center=CGPointMake(SCREEN_WIDTH/2, 240);
    [secondView addSubview:secondView.userName];
    [secondView addSubview:secondView.passWord];
    [secondView addSubview:secondView.nickname];
    [secondView.registerButton addTarget:self action:@selector(Register) forControlEvents:UIControlEventTouchDown];
    [secondView addSubview:secondView.registerButton];
    [self.view addSubview:secondView];
}
//sign up
-(void)Register{
    BmobUser *newUser = [[BmobUser alloc] init];
    [newUser setUsername:secondView.userName.text];
    [newUser setPassword:secondView.passWord.text];
    [newUser setObject:secondView.nickname.text forKey:@"nickname"];
    [newUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
-(void)toLoginView{
    
    [UIView flipTransitionFromView:secondView toView:firstView duration:1.0f completion:^(BOOL finished) {
        NSLog(@"complete");
    }];
    
}
-(void)toRegisterView{
    
    [UIView flipTransitionFromView:firstView toView:secondView duration:1.0f completion:^(BOOL finished) {
        NSLog(@"complete");
    }];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}

@end
