//
//  CarGroup.m
//  Car-Brand DisplayDemo
//
//  Created by 孙翔宇 on 15/5/27.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValue:dict[@"title"] forKey:@"title"];
        
        self.cars = [Car cars:dict[@"cars"]];
    }
    return self;
}

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)carGroups
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carGroupWithDict:dict]];
    }
    return arrayM;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {title: %@, cars: %@}",self.class,self,self.title, self.cars];
}
@end
