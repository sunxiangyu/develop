//
//  FriendModel.h
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *intro;
@property(nonatomic,copy) NSString *name;
@property(nonatomic, assign, getter = isVip) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)friendWithDict:(NSDictionary *)dict;

@end
