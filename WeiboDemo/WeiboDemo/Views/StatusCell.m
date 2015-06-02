//
//  StatusCell.m
//  WeiboDemo
//
//  Created by 孙翔宇 on 15/6/1.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "StatusCell.h"
#import "Status.h"
#import "StatusFrame.h"

#define kNameFont [UIFont systemFontOfSize:14]
#define kTextFont [UIFont systemFontOfSize:16]


@interface StatusCell()

@property(nonatomic,strong) UIImageView *iconView;
@property(nonatomic,strong) UILabel *nameView;
@property(nonatomic,strong) UIImageView *vipView;
@property(nonatomic,strong) UILabel *textView;
@property(nonatomic,strong) UIImageView *pictureView;

@end

@implementation StatusCell

- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}

- (UILabel *)nameView
{
    if (_nameView == nil) {
        _nameView = [[UILabel alloc] init];
        _nameView.font = kNameFont;
        [self.contentView addSubview:_nameView];
    }
    return _nameView;
}

-(UIImageView *)vipView
{
    if (_vipView == nil) {
        _vipView = [[UIImageView alloc] init];
        _vipView.image = [UIImage imageNamed:@"vip"];
        _vipView.hidden = YES;
        
        [self.contentView addSubview:_vipView];
    }
    return _vipView;
}

-(UILabel *)textView
{
    if (_textView == nil) {
        _textView = [[UILabel alloc] init];
        _textView.font = kTextFont;
        _textView.numberOfLines = 0;
        
        [self.contentView addSubview:_textView];
    }
    return _textView;
}

-(UIImageView *)pictureView
{
    if (_pictureView == nil) {
        _pictureView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}

- (void)setStatusFrame:(StatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    [self settingData];
    
    [self settingFrame];
}

/** 设置数据  */
-(void)settingData
{
    Status *status = self.statusFrame.status;
    self.iconView.image = [UIImage imageNamed:status.icon];
    self.nameView.text = status.name;
    
    if (status.vip) {
        self.vipView.hidden = NO;
    } else {
        self.vipView.hidden = YES;
    }
    
    self.textView.text = status.text;
    
    if (status.picture.length > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    } else {
        self.pictureView.hidden = YES;
    }
}


/** 设置位置 */
-(void)settingFrame
{
   
    
    self.iconView.frame = self.statusFrame.iconF;
    
    self.nameView.frame = self.statusFrame.nameF;
    
   
    self.vipView.frame = self.statusFrame.vipF;
    
    
    self.textView.frame = self.statusFrame.textF;
    
   
    
    if (self.statusFrame.status.picture.length > 0) {
       
        self.pictureView.frame = self.statusFrame.pictureF;
        
    }    
}

@end
