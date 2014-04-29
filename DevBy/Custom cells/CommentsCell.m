//
//  CommentsCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsCell.h"

static float xOffset = 10.0f;

@interface CommentsCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation CommentsCell

-(void)drawCellWithOffset:(int)offset
{
    self.totalHeight = 0;
    CGRect usernameRect = CGRectMake(xOffset + offset*xOffset, xOffset, 0, 0);
    UILabel * usernameLabel = [[UILabel alloc] initWithFrame:usernameRect];
    usernameLabel.font = [UIFont systemFontOfSize:13];
    usernameLabel.text = self.username;
    [usernameLabel sizeToFit];
    [self addSubview:usernameLabel];
    self.totalHeight += usernameRect.origin.y +  usernameLabel.bounds.size.height + xOffset/2;
    
    CGRect dateLabelRect = CGRectMake(xOffset + offset*xOffset, self.totalHeight, 0, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelRect];
    dateLabel.font = [UIFont systemFontOfSize:11];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.text = self.date;
    [dateLabel sizeToFit];
    [self addSubview:dateLabel];
    self.totalHeight += dateLabel.bounds.size.height + xOffset;
    
    CGRect commentRect = CGRectMake(xOffset + offset*xOffset, self.totalHeight, self.bounds.size.width - 2*xOffset - offset*xOffset, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:12];
    commentLabel.numberOfLines = 0;
    commentLabel.text = self.comment;
    [commentLabel sizeToFit];
    [self addSubview:commentLabel];
    self.totalHeight += commentLabel.bounds.size.height + xOffset;
}

@end
