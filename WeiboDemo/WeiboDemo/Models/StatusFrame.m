//
//  StatusFrame.m
//  WeiboDemo
//
//  Created by 孙翔宇 on 15/6/1.
//  Copyright (c) 2015年 孙翔宇. All rights reserved.
//

#import "StatusFrame.h"
#import "Status.h"

#define kNameFont [UIFont systemFontOfSize:14]
#define kTextFont [UIFont systemFontOfSize:16]


@implementation StatusFrame

-(void)setStatus:(Status *)status
{
    _status = status;
    
    
    CGFloat padding = 10;
    
    // 1.头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    
    self.iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2.姓名
    NSDictionary *nameDict = @{NSFontAttributeName : kNameFont};
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    nameFrame.origin.x = padding + CGRectGetMaxX(self.iconF);
    nameFrame.origin.y = padding + (self.iconF.size.height - nameFrame.size.height) * 0.5;
    self.nameF = nameFrame;
    
    //3.vip图标
    CGFloat vipX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipY = self.nameF.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    //4.正文
    NSDictionary *textDict = @{NSFontAttributeName : kTextFont};
    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconF) + padding;
    self.textF = textFrame;
    
    //5.图片
    
    if (self.status.picture.length > 0) {
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        self.cellHeight = CGRectGetMaxY(self.pictureF) + padding;
        
    } else {
        self.cellHeight = CGRectGetMaxY(self.textF) + padding;
    }

    
}

+ (NSArray *)statusFrames
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        StatusFrame *statusFrame = [[StatusFrame alloc] init];
        
        Status *status = [Status statusWithDict:dict];
        
        statusFrame.status = status;
        
        [arrM addObject:statusFrame];
    }
    return arrM;
}

@end
