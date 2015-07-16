//
//  ViewController.m
//  File Download Demo
//
//  Created by 孙翔宇 on 15/7/15.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<NSURLConnectionDataDelegate>

@property(nonatomic,assign) long long totalLength;

@property(nonatomic, assign) long long currentLength;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;


@property(nonatomic, strong) NSFileHandle *handler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/MJServer/resources/videos.zip"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filepath = [caches stringByAppendingPathComponent:@"videos.zip"];
    NSLog(@"%@", filepath);
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    [mgr createFileAtPath:filepath contents:nil attributes:nil];
    
    self.handler = [NSFileHandle fileHandleForWritingAtPath:filepath];
    
    self.totalLength = response.expectedContentLength;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [self.handler seekToEndOfFile];
    
    [self.handler writeData:data];
    
    self.currentLength += data.length;
    
    self.progressView.progress = (double)self.currentLength / self.totalLength;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.currentLength = 0;
    self.totalLength = 0;
    
    [self.handler closeFile];
    self.handler = nil;
}



@end
