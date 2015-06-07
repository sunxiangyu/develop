//
//  FriendModel.m
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
