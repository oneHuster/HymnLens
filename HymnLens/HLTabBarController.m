//
//  HLTabBarController.m
//  HymnLens
//
//  Created by 陈志浩 on 16/1/28.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "HLTabBarController.h"

@interface HLTabBarController ()

@end

@implementation HLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSubViewController{
    self.tabBar.tintColor = [UIColor blackColor];
    
    self.linkViewController = [[LinkViewController alloc]init];
    UINavigationController * linkNav = [[UINavigationController alloc]initWithRootViewController:self.linkViewController];
    linkNav.tabBarItem.title = @"连接";
    linkNav.tabBarItem.image = [UIImage imageNamed:@"wifi.png"];
    self.videoViewController = [[VideoViewController alloc]init];
    UINavigationController * videoNav = [[UINavigationController alloc]initWithRootViewController:self.videoViewController];
    videoNav.tabBarItem.title = @"视频库";
    videoNav.tabBarItem.image = [UIImage imageNamed:@"media.png"];
    self.communityViewController = [[CommunityViewController alloc]init];
    UINavigationController * communityNav = [[UINavigationController alloc]initWithRootViewController:self.communityViewController];
    communityNav.tabBarItem.title = @"社区";
    communityNav.tabBarItem.image = [UIImage imageNamed:@"shequhuati.png"];
    self.viewControllers = @[linkNav, videoNav, communityNav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
