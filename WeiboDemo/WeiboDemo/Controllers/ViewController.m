//
//  ViewController.m
//  WeiboDemo
//
//  Created by 孙翔宇 on 15/6/1.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "StatusCell.h"
#import "StatusFrame.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray *statusFrames;

@end

@implementation ViewController

- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        _statusFrames = [StatusFrame statusFrames];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 200;
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    StatusFrame *statusFrame = self.statusFrames[indexPath.row];
    cell.statusFrame = statusFrame;
    
    return cell;
}

#pragma mark - 代理方法

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}


@end
