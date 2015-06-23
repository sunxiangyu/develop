//
//  View.m
//  RefreshFrameDemo
//
//  Created by 孙翔宇 on 15/6/22.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "View.h"

@implementation View

-(void)setRadius:(float)radius
{
    _radius = radius;
    
    [self setNeedsDisplay];
}

-(void)awakeFromNib
{
    self.radius = 10;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, 100, 100, self.radius, 0, 2 * M_PI, 0);
    
    [[UIColor purpleColor] set];
    
    CGContextFillPath(ctx);
}

@end
