//
//  Province.h
//  PickerViewDemo1
//
//  Created by 孙翔宇 on 15/6/9.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property(nonatomic, strong)NSArray *cities;

@property(nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)provinceWithDict:(NSDictionary *)dict;

@end
