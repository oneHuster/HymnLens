//
//  adminCell.m
//  HymnLens
//
//  Created by 邹应天 on 16/2/20.
//  Copyright © 2016年 陈志浩. All rights reserved.
//

#import "adminCell.h"
@interface adminCell()
@property UIImageView *faviconV;
@end
@implementation adminCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

-(void)createWithImage:(UIImage*)image
{
    self.faviconV = [UIImageView new];
    self.faviconV.image = image;
    self.faviconV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.faviconV];
    [self.faviconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
}

-(void)createWithDetailLabel:(NSString *)string
{
    self.detailTextLabel.textColor = [UIColor grayColor];
    self.detailTextLabel.text = string;
}

@end
