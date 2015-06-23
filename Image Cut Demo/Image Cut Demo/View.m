//
//  View.m
//  Image Cut Demo
//
//  Created by 孙翔宇 on 15/6/20.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "View.h"

@implementation View

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
    
    CGContextClip(ctx);
    
    CGContextStrokePath(ctx);
    
    UIImage *image = [UIImage imageNamed:@"me"];
    [image drawAtPoint:CGPointMake(100, 100)];
    
    
    CGContextFillPath(ctx);
}

@end
