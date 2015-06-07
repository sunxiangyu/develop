//
//  FriendCell.m
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "FriendCell.h"
#import "FriendModel.h"

@implementation FriendCell

+ (instancetype)friendCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setFriendData:(FriendModel *)friendData
{
    _friendData = friendData;
    
    self.imageView.image = [UIImage imageNamed:_friendData.icon];
    
    self.textLabel.text = _friendData.name;
    
    self.detailTextLabel.text = _friendData.intro;
    
    if (_friendData.isVip) {
        [self.textLabel setTextColor:[UIColor redColor]];
    } else {
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
    
    
}

@end
