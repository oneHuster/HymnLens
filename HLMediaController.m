//
//  HLMediaController.m
//  HymnLens
//
//  Created by 陈志浩 on 16/2/19.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "HLMediaController.h"
#import <AVFoundation/AVFoundation.h>

@interface HLMediaController ()

@end

@implementation HLMediaController
- (instancetype)initWithVideoPath:(NSString *)videoPath{
    if (self = [super init]){
        self.videoPath = videoPath;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * videoPath = self.videoPath;
    NSURL * videoPathURL = [NSURL fileURLWithPath:videoPath];
    AVAsset *videoAsset = [AVURLAsset URLAssetWithURL:videoPathURL options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:videoAsset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.layer.bounds;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    [self.view.layer addSublayer:playerLayer];
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
