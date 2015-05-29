//
//  Car.m
//  Car-Brand DisplayDemo
//
//  Created by 孙翔宇 on 15/5/27.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)cars:(NSArray *)array
{
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carWithDict:dict]];
    }
    return arrayM;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {name: %@, icon:%@}", self.class, self, self.name, self.icon];
}
@end
