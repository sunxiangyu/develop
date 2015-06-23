//
//  MyView.m
//  SnowFlashDemo
//
//  Created by 孙翔宇 on 15/6/22.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property(nonatomic, assign) int imageY;

@end

@implementation MyView


-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage)];
        
        [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        
    }
    return self;
}

-(void)updateImage
{
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    self.imageY += 5;
    
    if (self.imageY > rect.size.height) {
        self.imageY = 0;
    }
    
    UIImage *image = [UIImage imageNamed:@"me"];
    [image drawAtPoint:CGPointMake(10, self.imageY)];
    
}



@end
