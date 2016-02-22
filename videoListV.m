//
//  videoListV.m
//  HymnLens
//
//  Created by 陈志浩 on 16/2/13.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "videoListV.h"
#import "videoV.h"

@implementation videoListV

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)init{
    if (self = [super init]){
        [self loadConfiguration];
    }
    return self;
}

- (void)loadConfiguration{
    self.showsVerticalScrollIndicator = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.scrollEnabled = YES;
    self.canCancelContentTouches = YES;
}


- (void)setCount:(NSInteger)count{
    NSMutableArray * videoMuteArr = [NSMutableArray arrayWithCapacity:count];
    NSInteger line, row;
    for (int i = 0 ; i < count ; i++){
        videoV * subVideoV = [[videoV alloc]init];
        subVideoV.tag = i;
        [self addSubview:subVideoV];
        [videoMuteArr addObject:subVideoV];
    }
    _videoArr = [NSArray arrayWithArray:videoMuteArr];
    NSInteger number = 0;
    for (videoV * subVideoV in _videoArr){
        line = number / 3 + 1;
        row = number % 3 + 1;
        [subVideoV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(7 * row + (SCREEN_WIDTH
 - 28) / 3 * (row - 1));
            make.top.equalTo(self.mas_top).with.offset(7 * line + (SCREEN_WIDTH
 - 28) / 3 * (line - 1));
            make.width
.mas_equalTo([NSNumber numberWithFloat:(SCREEN_WIDTH
 - 28) / 3]);
            make.height.mas_equalTo([NSNumber numberWithFloat:(SCREEN_WIDTH
 - 28) / 3]);
        }];
        number += 1;
    }
    _count = count;
}

@end
