//
//  FeedbackCell.m
//  DevBy
//
//  Created by Anastasia on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "FeedbackCell.h"
<<<<<<< HEAD

static float xOffset = 10.0f;
=======
#import "constants.h"
>>>>>>> sazonova

@interface FeedbackCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation FeedbackCell

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
=======
>>>>>>> sazonova
    
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
    
<<<<<<< HEAD
    CGRect commentRect = CGRectMake(xOffset + offset*xOffset, self.totalHeight, self.bounds.size.width - 2*xOffset - offset*xOffset, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:12];
=======
    CGRect usernameRect = CGRectMake(halfOffset + offset*halfOffset, halfOffset, 0, 0);
    UILabel * usernameLabel = [[UILabel alloc] initWithFrame:usernameRect];
    usernameLabel.font = [UIFont boldSystemFontOfSize:FBCUsernameFont];
    usernameLabel.text = self.username;
    [usernameLabel sizeToFit];
    [self addSubview:usernameLabel];
    self.totalHeight += usernameRect.origin.y +  usernameLabel.bounds.size.height;
    
    CGRect jobRateRect = CGRectMake(12 * halfOffset + usernameLabel.bounds.size.width + offset*halfOffset, halfOffset, self.bounds.size.width*0.8, 0);
    UILabel * jobRateLabel = [[UILabel alloc] initWithFrame:jobRateRect];
    jobRateLabel.font = [UIFont boldSystemFontOfSize:FBCUsernameFont];
    jobRateLabel.numberOfLines = 0;
    jobRateLabel.text = self.rating;
    [jobRateLabel sizeToFit];
    [self addSubview:jobRateLabel];
    
    CGRect jobExperienceRect = CGRectMake(halfOffset + offset*halfOffset, 3 * halfOffset, self.bounds.size.width*0.8, 0);
    UILabel * jobExperienceLabel = [[UILabel alloc] initWithFrame:jobExperienceRect];
    jobExperienceLabel.font = [UIFont boldSystemFontOfSize:FBCLabelFont];
    jobExperienceLabel.numberOfLines = 0;
    jobExperienceLabel.text = self.jobExperience;
    [jobExperienceLabel sizeToFit];
    [self addSubview:jobExperienceLabel];
    self.totalHeight += jobExperienceRect.origin.y +  jobExperienceLabel.bounds.size.height;
    
    CGRect backgroundViewRect = CGRectMake(halfOffset/2, 0, self.bounds.size.width*0.86, self.totalHeight - 2 * halfOffset);
    backGroundView.frame = backgroundViewRect;
    [backGroundView.layer setCornerRadius:9.0f];
    [backGroundView.layer setBorderColor:[UIColor grayColor].CGColor];
    [backGroundView.layer setBorderWidth:1.5f];
    
    CGRect commentRect = CGRectMake(halfOffset + offset*halfOffset, self.totalHeight - 1.5 * halfOffset, self.bounds.size.width*0.8, 0);
    UILabel * commentLabel = [[UILabel alloc] initWithFrame:commentRect];
    commentLabel.font = [UIFont systemFontOfSize:FBCTextFont];
>>>>>>> sazonova
    commentLabel.numberOfLines = 0;
    commentLabel.text = self.comment;
    [commentLabel sizeToFit];
    [self addSubview:commentLabel];
<<<<<<< HEAD
    self.totalHeight += commentLabel.bounds.size.height + xOffset;
=======
    self.totalHeight += commentLabel.bounds.size.height;
>>>>>>> sazonova
}

@end
