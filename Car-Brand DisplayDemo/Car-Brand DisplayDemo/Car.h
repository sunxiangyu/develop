//
//  Car.h
//  Car-Brand DisplayDemo
//
//  Created by 孙翔宇 on 15/5/27.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carWithDict:(NSDictionary *)dict;

+ (NSArray *)cars:(NSArray *)array;
@end
