//
//  signUpViewController.h
//  Bignote
//
//  Created by 邹应天 on 15/10/30.
//  Copyright (c) 2015年 邹应天. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UserInfo.h"
#import <Bmob.h>
@interface signUpViewController : UIViewController<UITextFieldDelegate>

@property UIImageView *favicon;
//@property UIImage *faviconImage;
//@property CGPoint faviconCenter;
//@property UITextField *userName;
//@property UITextField *passWord;
//@property UIButton *loginButton;
//@property UILabel *warningLabel;

-(void)RegisterViewInit;
@end
