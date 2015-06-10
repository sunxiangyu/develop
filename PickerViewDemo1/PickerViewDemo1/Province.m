//
//  Province.m
//  PickerViewDemo1
//
//  Created by 孙翔宇 on 15/6/9.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "Province.h"

@implementation Province

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
