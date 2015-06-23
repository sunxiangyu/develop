//
//  ViewController.m
//  CutImageDemo2
//
//  Created by 孙翔宇 on 15/6/22.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"me"];
    
    CGFloat margin = 20;
    CGSize size = CGSizeMake(image.size.width + margin, image.size.height + margin);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, size.width, size.height));
    [[UIColor greenColor] set];
    CGContextFillPath(ctx);
    
    CGFloat smallX = margin * 0.5;
    CGFloat smallY = margin * 0.5;
    CGFloat smallW = image.size.width;
    CGFloat smallH = image.size.height;
    
    CGContextAddEllipseInRect(ctx, CGRectMake(smallX, smallY, smallW, smallH));
    CGContextClip(ctx);
    
    [image drawInRect:CGRectMake(smallX, smallY, smallW, smallH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    self.iv.image = newImage;
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"abc.png"];
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:path atomically:YES];
    
}



@end
