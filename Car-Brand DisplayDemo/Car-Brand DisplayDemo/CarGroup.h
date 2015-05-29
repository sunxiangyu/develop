//
//  CarGroup.h
//  Car-Brand DisplayDemo
//
//  Created by 孙翔宇 on 15/5/27.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carGroupWithDict:(NSDictionary *)dict;

+ (NSArray *)carGroups;
@end
