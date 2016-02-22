//
//  communityDetailVC.m
//  HymnLens
//
//  Created by 邹应天 on 16/2/16.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "communityDetailVC.h"
#import "adminCell.h"
#import "signUpViewController.h"

static NSString *cellIdentifier = @"cell";
#define padding 10
@interface communityDetailVC()<UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableview;
//@property UIView *displayV;
//@property UITableView *tableview;
//@property UIButton *loginButton;
@property NSArray *optionArr;
@property signUpViewController *signupVC;
@end
@implementation communityDetailVC

-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.optionArr = [[NSArray alloc]initWithObjects:@"Favicon",@"Nickname",@"Region",@"Modify Password",@"Change Account",@"Logout",@"Setting", nil];
    [self initWithSignUpVC];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [self initWithTableView];
}
-(void)initWithSignUpVC{
    self.signupVC = [[signUpViewController alloc]init];
    
}
#pragma  mark -----------------------------tableview
-(void)initWithTableView{
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //[self initWithHeadView];
    //self.tableview.tableHeaderView = self.headV;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[adminCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:self.tableview];
}
//-(void)initWithHeadView{
//    self.headV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VC_WIDTH, 140)];
//    
//}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return 80;
    }
    
    return tableView.rowHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    adminCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    cell.textLabel.text = [self.optionArr objectAtIndex:indexPath.row];
    if (indexPath.section==0) {
        if (indexPath.row == 0) {
            [cell createWithImage:[UIImage imageNamed:@"gentleman.png"]];
        }
    }
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 5) {
        [self.navigationController pushViewController:self.signupVC animated:YES];
    }
}

//这什么方法？
-(void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    
}
//-(void)initWithDisplayView{
//    _displayV = [[UIView alloc]initWithFrame:CGRectMake(padding, 64 + 50, VC_WIDTH - padding*2, VC_HEIGHT - (64+50)*2 )];
//    [self.view addSubview:_displayV];
//}
//-(void)initWithButtons{
//    float width = _displayV.bounds.size.width;
//    float height  =  _displayV.bounds.size.height;
//    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, width/2  , height/2)];
//    _loginButton.backgroundColor = [UIColor purpleColor];
//    [_displayV addSubview:_loginButton];
//
//}
//-(void)animationWithButtons{
//    _loginButton.transform = CGAffineTransformMakeScale(0.3, 0.3);
//    _loginButton.alpha = 0;
//    [UIView animateWithDuration:1 animations:^{
//        _loginButton.transform = CGAffineTransformMakeScale(1, 1);
//        _loginButton.alpha = 1;
//    }];
//    
//}
@end
