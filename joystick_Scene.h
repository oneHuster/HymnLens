//
//  joystick_Scene.h
//  HymnLens
//
//  Created by 邹应天 on 16/2/22.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Joystick.h"
@class Joystick;
@interface joystick_Scene : SKScene
@property Joystick *leftJoystick;
@property Joystick *rightJoystick;


@property (strong,nonatomic) SKSpriteNode *jsThumb;
@property (strong,nonatomic) SKSpriteNode *jsBackdrop;
@property (strong,nonatomic) SKSpriteNode *jsThumb2;
@property (strong,nonatomic) SKSpriteNode *jsBackdrop2;

@property AVPlayer *player;
@property SKVideoNode *videoNode;
-(void)OrientationLeftRotate;
@end
