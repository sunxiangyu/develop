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

@interface VideoViewController ()

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
        
        GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
        
        GDataXMLElement *root = doc.rootElement;
        
        NSArray *elements = [root elementsForName:@"video"];
        
        for (GDataXMLElement *element in elements) {
            HMVideo *video = [[HMVideo alloc] init];
            
            video.id = [element attributeForName:@"id"].stringValue.intValue;
            video.name = [element attributeForName:@"name"].stringValue;
            video.length = [element attributeForName:@"length"].stringValue.intValue;
            video.url = [element attributeForName:@"url"].stringValue;
            video.image = [element attributeForName:@"image"].stringValue;
            
            [self.videos addObject:video];
        }
        
        [self.tableView reloadData];
    }];
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
