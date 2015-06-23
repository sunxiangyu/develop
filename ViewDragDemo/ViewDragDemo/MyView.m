//
//  MyView.m
//  ViewDragDemo
//
//  Created by 孙翔宇 on 15/6/22.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    
    CGPoint previousPoint = [touch previousLocationInView:touch.view];
    
    CGPoint currentPoint = [touch locationInView:touch.view];
    
    CGFloat moveX = currentPoint.x - previousPoint.x;
    CGFloat moveY = currentPoint.y - previousPoint.y;
    
    CGPoint tmp = self.center;
    tmp.x += moveX;
    tmp.y += moveY;
    self.center = tmp;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}

@end
