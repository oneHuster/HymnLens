//
//  communityDetailVC.m
//  HymnLens
//
//  Created by 邹应天 on 16/2/16.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "communityDetailVC.h"
@interface communityDetailVC()
@property UITableView *tableview;
@end
@implementation communityDetailVC

-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

@end
