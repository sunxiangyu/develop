//
//  VideoViewController.m
//  Xml Parse Demo
//
//  Created by 孙翔宇 on 15/7/12.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "VideoViewController.h"
#import "HMVideo.h"
#import "MBProgressHUD+MJ.h"
#import "UIImageView+WebCache.h"
#import "GDataXMLNode.h"
#import <MediaPlayer/MediaPlayer.h>

#define kUrl(path) [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8080/MJServer/%@", path]]

@interface VideoViewController ()<NSXMLParserDelegate>

@property(nonatomic,strong) NSMutableArray *videos;

@end

@implementation VideoViewController

-(NSMutableArray *)videos
{
    if (_videos == nil) {
        _videos = [[NSMutableArray alloc] init];
    }
    return _videos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = kUrl(@"video?type=XML");
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data == nil || connectionError) {
            [MBProgressHUD showError:@"请求失败"];
            return;
        }
        
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        
        parser.delegate = self;
        
        [parser parse];
        
        [self.tableView reloadData];
    }];
}


#pragma mark - NSXMLParserDelegate

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"parserDidStartDocument");
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([@"videos" isEqualToString:elementName]) return;
    HMVideo *video = [HMVideo videoWithDict:attributeDict];
    [self.videos addObject:video];
        
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"didEndElement");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"parserDidEndDocument");
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"video";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    HMVideo *video = self.videos[indexPath.row];
    cell.textLabel.text = video.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"时长 : %d 分钟", video.length];
    
    NSURL *url = kUrl(video.image);
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMVideo *video = self.videos[indexPath.row];
    
    NSURL *url = kUrl(video.url);
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    [self presentViewController:player animated:YES completion:nil];
}



@end
