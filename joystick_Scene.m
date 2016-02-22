//
//  joystick_Scene.m
//  HymnLens
//
//  Created by 邹应天 on 16/2/22.
//  Copyright © 2016年 陈志浩. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "joystick_Scene.h"
static NSString *movieURLstring = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";

@implementation joystick_Scene

-(id)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    
    
    
    
    
    self.jsThumb = [SKSpriteNode spriteNodeWithImageNamed:@"joystick"];
    self.jsBackdrop = [SKSpriteNode spriteNodeWithImageNamed:@"dpad"];
    
    self.leftJoystick = [Joystick joystickWithThumb:self.jsThumb andBackdrop:self.jsBackdrop];
    self.jsThumb2 = [SKSpriteNode spriteNodeWithImageNamed:@"joystick"];
    self.jsBackdrop2 = [SKSpriteNode spriteNodeWithImageNamed:@"dpad"];
    
    self.rightJoystick = [Joystick joystickWithThumb:self.jsThumb2 andBackdrop:self.jsBackdrop2];
    [self createVideo];
    [self OrientationLeftRotate];
    
    return self;
}
-(void)OrientationLeftRotate{
    self.leftJoystick.position = CGPointMake(self.frame.size.width/2-200,self.frame.size.height/2-100);
    self.rightJoystick.position = CGPointMake(self.frame.size.width/2+200, self.leftJoystick.position.y);
    
    [self addChild:self.leftJoystick];
    [self addChild:self.rightJoystick];
}
-(void)createVideo{

    NSURL *fileURL = [NSURL URLWithString:movieURLstring];
        _player = [AVPlayer playerWithURL: fileURL];
        // 4
        _videoNode = [[SKVideoNode alloc]initWithAVPlayer:_player];
//        _videoNode.size =  CGSizeMake(self.size.width -200,self.size.height);
        _videoNode.zPosition = -20;
        _videoNode.size = self.size;
        _videoNode.anchorPoint = CGPointMake(0.5, 0.5);
        _videoNode.position = CGPointMake(self.size.width/2,self.size.height/2);
        // 5
       // [cropNode addChild:_videoNode];
    
        [self addChild: _videoNode];
        [_videoNode play];

}

@end
