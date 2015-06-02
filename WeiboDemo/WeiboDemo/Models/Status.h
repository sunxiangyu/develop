//
//  Status.h
//  WeiboDemo
//
//  Created by 孙翔宇 on 15/6/1.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *picture;
@property(nonatomic,assign) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statusWithDict:(NSDictionary *)dict;

+(NSArray *)statuses;
@end
