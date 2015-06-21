//
//  HumanView.m
//  quartz2d
//
//  Created by 孙翔宇 on 15/6/20.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "HumanView.h"

#define kTopX rect.size.width * 0.5
#define kTopY 150
#define kTopRadius 80

@implementation HumanView

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawBody:rect context:ctx];
    
    [self drawEye:rect context:ctx];
    
    [self drawMouth:rect context:ctx];
}

-(void)drawMouth:(CGRect)rect context:(CGContextRef)ctx
{
    CGFloat controllerX = kTopX;
    CGFloat controllerY = rect.size.height * 0.5 - 30;
    
    CGFloat maginX = 20;
    CGFloat maginY = 10;
    CGFloat currentX = controllerX - maginX;
    CGFloat currentY = controllerY - maginY;
    CGContextMoveToPoint(ctx, currentX, currentY);
    
    CGFloat endX = controllerX + maginX;
    CGFloat endY = currentY;
    
    CGContextAddQuadCurveToPoint(ctx, controllerX, controllerY, endX, endY);
    
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 1);
    
    CGContextStrokePath(ctx);
    
    
}

-(void)drawEye:(CGRect)rect context:(CGContextRef)ctx
{
    CGFloat startX = kTopX - kTopRadius;
    CGFloat startY = kTopY;
    CGContextMoveToPoint(ctx, startX, startY);
    
    CGFloat endX = kTopX + kTopRadius;
    CGFloat endY = kTopY;
    CGContextAddLineToPoint(ctx, endX, endY);
    
    CGContextSetLineWidth(ctx, 18);
    
    [[UIColor blackColor] set];
    CGContextStrokePath(ctx);
    
    
    CGFloat leftRadius = 30;
    CGFloat leftX = kTopX - leftRadius;
    CGFloat leftY = kTopY;
    CGContextAddArc(ctx, leftX, leftY, leftRadius, 0, 2 * M_PI, 0);
    CGContextFillPath(ctx);
    
    CGFloat rightRadius = 30;
    CGFloat rightX = kTopX + rightRadius;
    CGFloat rightY = kTopY;
    CGContextAddArc(ctx, rightX, rightY, rightRadius, 0, 2 * M_PI, 0);
    CGContextFillPath(ctx);
    
    CGFloat leftSmallRadius = 20;
    CGFloat leftSmallX = leftX;
    CGFloat leftSmallY = leftY;
    CGContextAddArc(ctx, leftSmallX, leftSmallY, leftSmallRadius, 0, 2 * M_PI, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    
    
    CGFloat rightSmallRadius = 20;
    CGFloat rightSmallX = rightX;
    CGFloat rightSmallY = rightY;
    CGContextAddArc(ctx, rightSmallX, rightSmallY, rightSmallRadius, 0, 2 * M_PI, 0);
    CGContextFillPath(ctx);
}

-(void)drawBody:(CGRect)rect context:(CGContextRef)ctx
{
    CGFloat topX = kTopX;
    CGFloat topY = kTopY;
    CGFloat topRadius = kTopRadius;
    CGContextAddArc(ctx, topX, topY, topRadius, -M_PI, 0, 0);
    
    
    CGFloat midX = topRadius + topX;
    CGFloat midY = topY + 150;
    CGContextAddLineToPoint(ctx, midX, midY);
    
    
    CGFloat bottomRadius = topRadius;
    CGFloat bottomX = topX;
    CGFloat bottomY = midY;
    CGContextAddArc(ctx, bottomX, bottomY, bottomRadius, 0, M_PI, 0);
    
    CGContextClosePath(ctx);

    
    [[UIColor colorWithRed:252 / 255.0 green:218 / 255.0 blue:0 alpha:1.0] set];
    CGContextFillPath(ctx);
    
}

@end
