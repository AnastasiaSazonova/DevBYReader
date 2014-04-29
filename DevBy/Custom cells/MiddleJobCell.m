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
    CGRect jobTitleFrame = CGRectMake(offset, halfOffset, self.frame.size.width - 5*halfOffset, self.frame.size.height/2);
    UILabel * jobTitle = [[UILabel alloc] initWithFrame:jobTitleFrame];
    jobTitle.font = [UIFont systemFontOfSize:MJTitleFont];
    jobTitle.numberOfLines = 0;
    jobTitle.text = self.job.name;
    [jobTitle sizeToFit];
    [self addSubview:jobTitle];
    self.totalHeight += jobTitle.bounds.size.height + halfOffset;
    
    CGRect companysNameFrame = CGRectMake(offset, self.totalHeight, self.frame.size.width - 5*halfOffset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:MJCompanysNameFont];
    companysName.numberOfLines = 0;
    companysName.text = self.job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
    self.totalHeight += companysName.bounds.size.height + halfOffset;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, halfOffset, self.totalHeight)];
    view.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:122.0/255.0 alpha:0.4];
    [self addSubview:view];
}
@end
