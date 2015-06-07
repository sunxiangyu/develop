//
//  HeaderView.m
//  qq tableview demo
//
//  Created by 孙翔宇 on 15/6/7.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "HeaderView.h"
#import "FriendGroupModel.h"

@interface HeaderView ()

@property(nonatomic, weak) UIButton *btn;
@property(nonatomic, weak) UILabel *label;

@end

@implementation HeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (headerView == nil) {
        headerView = [[HeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
    
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *btn = [[UIButton alloc] init];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        self.btn = btn;
        
        
        UILabel *label = [[UILabel alloc] init];
        
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:label];
        self.label = label;
    }
    
    return self;
}

-(void)btnOnClick:(UIButton *)btn
{
    NSLog(@"被点击了");
    self.friendGroup.open = !self.friendGroup.isOpen;
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickHeaderView:)]) {
        [self.delegate headerViewDidClickHeaderView:self];
    }
    
}

- (void)didMoveToSuperview
{
    if (self.friendGroup.isOpen) {
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.btn.frame = self.bounds;
    
    CGFloat padding = 20;
    CGFloat labelY = 0;
    CGFloat labelW = 150;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - padding - labelW;
    self.label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

- (void)setFriendGroup:(FriendGroupModel *)friendGroup
{
    _friendGroup = friendGroup;
    
    [self.btn setTitle: _friendGroup.name forState:UIControlStateNormal];
    
    self.label.text = [NSString stringWithFormat:@"%@/%lu", _friendGroup.online, (unsigned long)_friendGroup.friends.count];
}

@end
