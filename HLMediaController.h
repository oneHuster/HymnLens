//
//  HLMediaController.h
//  HymnLens
//
//  Created by 陈志浩 on 16/2/19.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLMediaController : UIViewController
@property (nonatomic, strong) NSString * videoPath;
- (instancetype)initWithVideoPath:(NSString *)videoPath;
@end
