//
//  CommentsCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsCell.h"
<<<<<<< HEAD

static float xOffset = 10.0f;
=======
#import "Constants.h"
>>>>>>> sazonova

@interface CommentsCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation CommentsCell

-(void)drawCellWithOffset:(int)offset
{
    self.totalHeight = 0;
<<<<<<< HEAD
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
=======
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
>>>>>>> sazonova
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.text = self.date;
    [dateLabel sizeToFit];
    [self addSubview:dateLabel];
<<<<<<< HEAD
    self.totalHeight += dateLabel.bounds.size.height + xOffset;
    
    CGRect commentRect = CGRectMake(xOffset + offset*xOffset, self.totalHeight, self.bounds.size.width - 2*xOffset - offset*xOffset, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:12];
=======
    self.totalHeight += dateLabel.bounds.size.height + halfOffset;
    
    CGRect commentRect = CGRectMake(halfOffset + offset*halfOffset, self.totalHeight, self.frame.size.width - 2 * halfOffset - 2 * offset *halfOffset - 2 * halfOffset, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:CCCommentFont];
>>>>>>> sazonova
    commentLabel.numberOfLines = 0;
    commentLabel.text = self.comment;
    [commentLabel sizeToFit];
    [self addSubview:commentLabel];
<<<<<<< HEAD
    self.totalHeight += commentLabel.bounds.size.height + xOffset;
=======
    self.totalHeight += commentLabel.bounds.size.height + halfOffset;
<<<<<<< HEAD
>>>>>>> sazonova
=======
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
>>>>>>> sazonova
}

@end
