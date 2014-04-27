//
//  FeedbackCell.m
//  DevBy
//
//  Created by Anastasia on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "FeedbackCell.h"
#import "constants.h"

@interface FeedbackCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation FeedbackCell

-(void)drawCellWithOffset:(int)offset
{
    self.totalHeight = 0;
    CGRect usernameRect = CGRectMake(halfOffset + offset*halfOffset, halfOffset, 0, 0);
    UILabel * usernameLabel = [[UILabel alloc] initWithFrame:usernameRect];
    usernameLabel.font = [UIFont systemFontOfSize:FBCUsernameFont];
    usernameLabel.text = self.username;
    [usernameLabel sizeToFit];
    [self addSubview:usernameLabel];
    self.totalHeight += usernameRect.origin.y +  usernameLabel.bounds.size.height + halfOffset/2;
    
    
    CGRect commentRect = CGRectMake(halfOffset + offset*halfOffset, self.totalHeight, self.bounds.size.width - 2*halfOffset - offset*halfOffset, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:FBCTextFont];
    commentLabel.numberOfLines = 0;
    commentLabel.text = self.comment;
    [commentLabel sizeToFit];
    [self addSubview:commentLabel];
    self.totalHeight += commentLabel.bounds.size.height + halfOffset;
}

@end
