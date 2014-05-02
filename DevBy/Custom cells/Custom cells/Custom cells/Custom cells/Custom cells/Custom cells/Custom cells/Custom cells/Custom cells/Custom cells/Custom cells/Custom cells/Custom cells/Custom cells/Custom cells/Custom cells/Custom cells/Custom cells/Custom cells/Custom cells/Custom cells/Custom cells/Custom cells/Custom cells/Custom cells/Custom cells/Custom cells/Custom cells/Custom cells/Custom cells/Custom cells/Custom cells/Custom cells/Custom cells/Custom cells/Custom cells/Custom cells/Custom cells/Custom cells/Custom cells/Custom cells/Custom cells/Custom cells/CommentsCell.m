//
//  CommentsCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsCell.h"
#import "Constants.h"

@interface CommentsCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation CommentsCell

-(void)drawCellWithOffset:(int)offset
{
    self.totalHeight = 0;
    CGRect usernameRect = CGRectMake(halfOffset + offset*halfOffset, halfOffset, 0, 0);
    UILabel * usernameLabel = [[UILabel alloc] initWithFrame:usernameRect];
    usernameLabel.font = [UIFont systemFontOfSize:CCUsernameFont];
    usernameLabel.text = self.username;
    [usernameLabel sizeToFit];
    [self addSubview:usernameLabel];
    self.totalHeight += usernameRect.origin.y +  usernameLabel.bounds.size.height + halfOffset/2;
    
    CGRect dateLabelRect = CGRectMake(halfOffset + offset*halfOffset, self.totalHeight, 0, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelRect];
    dateLabel.font = [UIFont systemFontOfSize:CCDateLabelFont];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.text = self.date;
    [dateLabel sizeToFit];
    [self addSubview:dateLabel];
    self.totalHeight += dateLabel.bounds.size.height + halfOffset;
    
    CGRect commentRect = CGRectMake(halfOffset + offset*halfOffset, self.totalHeight, self.frame.size.width - 2 * halfOffset - 2 * offset *halfOffset - 2 * halfOffset, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:CCCommentFont];
    commentLabel.numberOfLines = 0;
    commentLabel.text = self.comment;
    [commentLabel sizeToFit];
    [self addSubview:commentLabel];
    self.totalHeight += commentLabel.bounds.size.height + halfOffset;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
