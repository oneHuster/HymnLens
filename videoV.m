//
//  videoV.m
//  HymnLens
//
//  Created by 陈志浩 on 16/2/13.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "videoV.h"

@implementation videoV

- (instancetype)init{
    if (self = [super init]){
        [self loadSubviews];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)loadSubviews{
    _thumbnailV = [[UIImageView alloc]init];
    _thumbnailV.contentMode = UIViewContentModeScaleAspectFill;
    _thumbnailV.layer.masksToBounds = YES;
    [self addSubview:_thumbnailV];
    [_thumbnailV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

@end
