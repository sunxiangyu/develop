//
//  StatusFrame.h
//  WeiboDemo
//
//  Created by 孙翔宇 on 15/6/1.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Status;
@interface StatusFrame : NSObject

@property(nonatomic,assign) CGRect iconF;
@property(nonatomic,assign) CGRect nameF;
@property(nonatomic,assign) CGRect vipF;
@property(nonatomic,assign) CGRect textF;
@property(nonatomic,assign) CGRect pictureF;
/**行高*/
@property(nonatomic,assign) CGFloat cellHeight;

@property(nonatomic,strong) Status *status;

+ (NSArray *)statusFrames;

@end
