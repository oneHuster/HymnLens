//
//  loginView.m
//  Bignote
//
//  Created by 邹应天 on 15/11/8.
//  Copyright (c) 2015年 邹应天. All rights reserved.
//

#import "loginView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation loginView
+(void)initialize{
    //self=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}
-(id)init{
    self=[super init];
    self.frame=[UIScreen mainScreen].bounds;
    
    self.warningLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 150, self.frame.size.width-60, 50)];
    self.warningLabel.textColor=[UIColor redColor];
    
    self.favicon=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.favicon.center=CGPointMake(SCREEN_WIDTH/2,130);
    self.favicon.image=[UIImage imageNamed:@"portait.jpg"];
    
    self.userName=[[UITextField alloc] initWithFrame:CGRectMake(20, 200, self.frame.size.width-40, 50)];
    self.userName.backgroundColor=[UIColor whiteColor];
    self.userName.placeholder=[NSString stringWithFormat:@"Admin"];
    self.userName.layer.cornerRadius=5;
    self.passWord=[[UITextField alloc] initWithFrame:CGRectMake(20, 260, self.frame.size.width-40, 50)];
    self.passWord.backgroundColor=[UIColor whiteColor];
    self.passWord.placeholder=[NSString stringWithFormat:@"Password"];
    self.passWord.layer.cornerRadius=5;
    self.passWord.secureTextEntry=YES;
    self.nickname=[[UITextField alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width-40, 50)];
    self.nickname.backgroundColor=[UIColor whiteColor];
    self.nickname.placeholder=[NSString stringWithFormat:@"Nickname"];
    self.nickname.layer.cornerRadius=5;
    
    self.loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginButton setFrame:CGRectMake(20, 320, self.frame.size.width-40, 50)];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.layer.cornerRadius=5;
    
    self.registerButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.registerButton setFrame:CGRectMake(20, self.frame.size.height-200, self.frame.size.width-40, 50)];
    [self.registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [self.registerButton setBackgroundColor:[UIColor colorWithRed:255/255.0 green:165/255.0 blue:0/255.0 alpha:1]];
    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.registerButton.layer.cornerRadius=5;
    return self;
}
@end
