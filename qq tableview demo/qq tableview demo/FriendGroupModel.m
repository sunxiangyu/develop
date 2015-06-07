//
//  FriendGroupModel.m
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "FriendGroupModel.h"
#import "FriendModel.h"

@implementation FriendGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:self.friends.count];
        
        for (NSDictionary *dict in self.friends) {
            FriendModel *friend = [FriendModel friendWithDict:dict];
            [models addObject:friend];
        }
        self.friends = models;
    }
    return self;
}

+ (instancetype)friendGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
