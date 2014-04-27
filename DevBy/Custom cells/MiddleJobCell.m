//
//  MiddleJobCellTableViewCell.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MiddleJobCell.h"
#import "Job.h"
#import "MiddleJob.h"
#import "Constants.h"

@interface MiddleJobCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation MiddleJobCell

-(void)drawCell
{
    self.totalHeight = 0;
    CGRect jobTitleFrame = CGRectMake(offset, halfOffset, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * jobTitle = [[UILabel alloc] initWithFrame:jobTitleFrame];
    jobTitle.font = [UIFont systemFontOfSize:MJTitleFont];
    jobTitle.numberOfLines = 0;
    jobTitle.text = self.job.name;
    [jobTitle sizeToFit];
    [self addSubview:jobTitle];
    self.totalHeight += jobTitle.bounds.size.height;
    
    CGRect companysNameFrame = CGRectMake(offset, offset/1.4 + self.totalHeight, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:MJCompanysNameFont];
    companysName.numberOfLines = 0;
    companysName.text = self.job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
    self.totalHeight += companysName.bounds.size.height;
}

@end
