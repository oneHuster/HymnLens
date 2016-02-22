//
//  VideoViewController.m
//  HymnLens
//
//  Created by 陈志浩 on 16/1/28.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "VideoViewController.h"
#import "HLMediaController.h"
#import "videoListV.h"
#import "videoV.h"

@interface VideoViewController ()
@property (nonatomic, strong) NSMutableArray * videoList;
@property (nonatomic, strong) NSDictionary * videoInfo;
@property (nonatomic, strong) videoListV * mainV;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    for (UIView * subview in self.view.subviews){
        [subview removeFromSuperview];
    }
    [self loadVideoInfo];
    [self loadMainView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSInteger line = _mainV.count / 3;
    _mainV.contentSize = CGSizeMake(0, 7 * (line + 1) + (SCREEN_WIDTH - 28) / 3 * line);
    NSLog(@"Done");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadVideoInfo{
    NSArray * pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [pathArr objectAtIndex:0];
    NSString * filePath = [path stringByAppendingString:@"/videoInfo.plist"];
    NSString * thumbnailPath = [path stringByAppendingString:@"/Videos/01.jpeg"];
    NSString * videoPath = [path stringByAppendingString:@"/Videos/01.mp4"];
    NSDictionary * videoInfo = [NSDictionary dictionaryWithObjectsAndKeys:thumbnailPath, @"thumbnailPath", videoPath, @"videoPath", nil];
    NSArray * videoList = [NSArray arrayWithObject:videoInfo];
    [videoList writeToFile:filePath atomically:YES];
}
- (void)loadMainView{
    _mainV = [[videoListV alloc]init];
    [self.view addSubview:_mainV];
    [_mainV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    NSArray * pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [pathArr objectAtIndex:0];
    NSString * filePath = [path stringByAppendingString:@"/videoInfo.plist"];
    self.videoList = [NSMutableArray arrayWithContentsOfFile:filePath];
    _mainV.count = self.videoList.count;
    
    NSInteger cnt = 0;
    for (videoV * subVideoV in _mainV.videoArr){
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(displayVideo:)];
        tap.delegate = self;
        tap.numberOfTouchesRequired = 1;
        [subVideoV addGestureRecognizer:tap];
//        subVideoV.thumbnailV.image = [UIImage imageNamed:@"06.jpeg"];
        self.videoInfo = [self.videoList objectAtIndex:cnt];
        NSString * thumbnailPath = [self.videoInfo objectForKey:@"thumbnailPath"];
        UIImage * image = [UIImage imageWithContentsOfFile:thumbnailPath];
        subVideoV.thumbnailV.image = image;
        cnt++;
    }
}

- (void)displayVideo:(UITapGestureRecognizer *)tap{
    self.videoInfo  = [self.videoList objectAtIndex:tap.view.tag];
    NSString * videoPath = [self.videoInfo objectForKey:@"videoPath"];
    HLMediaController * videoPlayer = [[HLMediaController alloc]initWithVideoPath:videoPath];
    [self.navigationController pushViewController:videoPlayer animated:YES];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
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
