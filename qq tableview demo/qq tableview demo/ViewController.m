//
//  ViewController.m
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroupModel.h"
#import "FriendModel.h"
#import "FriendCell.h"
#import "HeaderView.h"

@interface ViewController ()<HeaderViewDelegate>

@property(nonatomic,strong) NSArray *qqGroups;

@end

@implementation ViewController

#pragma mark - 懒加载

-(NSArray *)qqGroups
{
    if (_qqGroups == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist"ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArray.count];
        
        for (NSDictionary *dict in dictArray) {
            [arrM addObject:[FriendGroupModel friendGroupWithDict:dict]];
        }
        _qqGroups = [arrM mutableCopy];
        
    }
    return _qqGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.qqGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FriendGroupModel *friendGroup = self.qqGroups[section];
    
    if (friendGroup.isOpen) {
        return friendGroup.friends.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [FriendCell friendCellWithTableView:tableView];
    
    FriendGroupModel *friendGroup = self.qqGroups[indexPath.section];
    FriendModel *friend = friendGroup.friends[indexPath.row];
    cell.friendData = friend;
    
    return cell;
}

- (void)headerViewDidClickHeaderView:(HeaderView *)headerView
{
    [self.tableView reloadData];
}

#pragma mark - 代理方法

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *headerView = [HeaderView headerViewWithTableView:tableView];
    headerView.delegate = self;
    
    FriendGroupModel *friendGroup = self.qqGroups[section];
    headerView.friendGroup = friendGroup;
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
