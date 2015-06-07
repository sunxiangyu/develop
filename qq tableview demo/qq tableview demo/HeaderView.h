//
//  HeaderView.h
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroupModel, HeaderView;

@protocol HeaderViewDelegate <NSObject>

-(void)headerViewDidClickHeaderView:(HeaderView *)headerView;

@end


@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong)FriendGroupModel *friendGroup;

@property(nonatomic,weak) id<HeaderViewDelegate> delegate;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
