//
//  PremiumJobCell.m
//  DevBy
//
//  Created by Anastasia on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "PremiumJobCell.h"
#import "Job.h"
#import "Constants.h"

@interface PremiumJobCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation PremiumJobCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:0.1];
    }
    return self;
}

-(void)drawCell
{
    self.totalHeight = 0;
    CGRect jobTitleFrame = CGRectMake(offset, halfOffset, self.frame.size.width - 5*halfOffset, self.frame.size.height/2);
    UILabel * jobTitle = [[UILabel alloc] initWithFrame:jobTitleFrame];
    jobTitle.font = [UIFont systemFontOfSize:PJCTitleFont];
    jobTitle.numberOfLines = 0;
    jobTitle.text = self.job.name;
    [jobTitle sizeToFit];
    [self addSubview:jobTitle];
    self.totalHeight += jobTitle.bounds.size.height + halfOffset;
    
    CGRect companysNameFrame = CGRectMake(offset, self.totalHeight, self.frame.size.width - 5*halfOffset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:PJCCompanysNameFont];
    companysName.numberOfLines = 0;
    companysName.text = self.job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
    self.totalHeight += companysName.bounds.size.height + halfOffset;
    
    CGRect jobDescriptionFrame = CGRectMake(offset, self.totalHeight, self.frame.size.width - 5*halfOffset, self.frame.size.height/2);
    UILabel * jobDescription = [[UILabel alloc] initWithFrame:jobDescriptionFrame];
    jobDescription.textColor = [UIColor grayColor];
    jobDescription.font = [UIFont systemFontOfSize:PJCDescriptionFont];
    jobDescription.numberOfLines = 0;
    jobDescription.text = self.job.description;
    [jobDescription sizeToFit];
    [self addSubview:jobDescription];
    self.totalHeight += jobDescription.bounds.size.height + 1.5*halfOffset;
}

@end
