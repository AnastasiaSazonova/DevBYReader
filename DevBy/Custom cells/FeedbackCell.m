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
//- (void)gotoC:(id)sender;
@end

@implementation FeedbackCell

-(void)drawCell
{    
    self.totalHeight = 0;
    UIView * backGroundView = [[UIView alloc] init];
    if (self.color == redColor)
    {
        backGroundView.backgroundColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:0.7];
    }
    else if(self.color == greenColor)
    {
        backGroundView.backgroundColor = [UIColor colorWithRed:102/255.0 green:255/255.0 blue:102/255.0 alpha:0.5];
    }
    [self addSubview:backGroundView];
    
    CGRect usernameRect = CGRectMake(halfOffset, halfOffset, 0, 0);
    UILabel * usernameLabel = [[UILabel alloc] initWithFrame:usernameRect];
    usernameLabel.font = [UIFont boldSystemFontOfSize:FBCUsernameFont];
    usernameLabel.text = self.username;
    [usernameLabel sizeToFit];
    usernameLabel.frame = CGRectMake(usernameLabel.frame.origin.x, usernameLabel.frame.origin.y, self.frame.size.width - 70, usernameLabel.frame.size.height);
    [self addSubview:usernameLabel];
    self.totalHeight += usernameRect.origin.y +  usernameLabel.bounds.size.height;

    CGRect jobRateRect = CGRectMake(2 * halfOffset + usernameLabel.bounds.size.width, halfOffset, self.bounds.size.width*0.8, 0);
    UILabel * jobRateLabel = [[UILabel alloc] initWithFrame:jobRateRect];
    jobRateLabel.font = [UIFont boldSystemFontOfSize:FBCUsernameFont];
    jobRateLabel.numberOfLines = 0;
    jobRateLabel.text = self.rating;
    [jobRateLabel sizeToFit];
    [self addSubview:jobRateLabel];
    
    CGRect jobExperienceRect = CGRectMake(halfOffset, 3 * halfOffset, self.bounds.size.width*0.8, 0);
    UILabel * jobExperienceLabel = [[UILabel alloc] initWithFrame:jobExperienceRect];
    jobExperienceLabel.font = [UIFont boldSystemFontOfSize:FBCLabelFont];
    jobExperienceLabel.numberOfLines = 0;
    jobExperienceLabel.text = self.jobExperience;
    [jobExperienceLabel sizeToFit];
    [self addSubview:jobExperienceLabel];
    self.totalHeight += jobExperienceRect.origin.y +  jobExperienceLabel.bounds.size.height;
    
    CGRect backgroundViewRect = CGRectMake(0, 0, self.bounds.size.width*0.935, self.totalHeight - 2 * halfOffset);
    backGroundView.frame = backgroundViewRect;
    [backGroundView.layer setBorderColor:[UIColor grayColor].CGColor];
    [backGroundView.layer setBorderWidth:1.5f];
    
    CGRect commentRect = CGRectMake(halfOffset, self.totalHeight - 1.5 * halfOffset, self.bounds.size.width*0.9, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:FBCTextFont];
    commentLabel.numberOfLines = 0;
    commentLabel.text = self.comment;
    [commentLabel sizeToFit];
    [self addSubview:commentLabel];
    self.totalHeight += commentLabel.bounds.size.height;
    
    if(self.commentsCount > 0)
    {        
        UIButton *commentsButton = [[UIButton alloc] init];
        commentsButton.frame = CGRectMake(halfOffset, self.totalHeight - 0.5 * halfOffset, self.bounds.size.width*0.9 - halfOffset, 30);
        [commentsButton setTitle:[NSString stringWithFormat:@"Комментариев: %d", self.commentsCount] forState:UIControlStateNormal];
        commentsButton.titleLabel.font = [UIFont systemFontOfSize:FBCTextFont];
        commentsButton.titleLabel.textColor = [UIColor grayColor];
        [commentsButton layer].borderWidth = 1;
        [commentsButton layer].borderColor = [UIColor grayColor].CGColor;
        [[commentsButton layer] setCornerRadius:4];
        [commentsButton addTarget:self action:@selector(gotoComments) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:commentsButton];
        self.totalHeight += commentsButton.bounds.size.height + halfOffset;
    }
}

- (void)gotoComments
{
    NSLog(@"%@", self.username);
}

@end
