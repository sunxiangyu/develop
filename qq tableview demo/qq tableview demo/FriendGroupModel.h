//
//  FriendGroupModel.h
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroupModel : NSObject

@property(nonatomic, strong) NSArray *friends;

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *online;

@property(nonatomic, assign, getter=isOpen) BOOL open;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)friendGroupWithDict:(NSDictionary *)dict;

@end
