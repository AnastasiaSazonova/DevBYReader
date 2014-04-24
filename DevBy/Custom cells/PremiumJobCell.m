//
//  PremiumJobCell.m
//  DevBy
//
//  Created by Anastasia on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "PremiumJobCell.h"
#import "PremiumJob.h"

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
    float yOffset = 10.0f;
    float xOffset = 20.0f;
    self.totalHeight = 0;
    CGRect jobTitleFrame = CGRectMake(xOffset, yOffset, self.frame.size.width - 5*yOffset, self.frame.size.height/2);
    UILabel * jobTitle = [[UILabel alloc] initWithFrame:jobTitleFrame];
    jobTitle.font = [UIFont systemFontOfSize:16];
    jobTitle.numberOfLines = 0;
    jobTitle.text = self.job.name;
    [jobTitle sizeToFit];
    [self addSubview:jobTitle];
    self.totalHeight += jobTitle.bounds.size.height + yOffset;
    
    CGRect companysNameFrame = CGRectMake(xOffset, self.totalHeight, self.frame.size.width - 5*yOffset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:13];
    companysName.numberOfLines = 0;
    companysName.text = self.job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
    self.totalHeight += companysName.bounds.size.height + yOffset;
    
    CGRect jobDescriptionFrame = CGRectMake(xOffset, self.totalHeight, self.frame.size.width - 5*yOffset, self.frame.size.height/2);
    UILabel * jobDescription = [[UILabel alloc] initWithFrame:jobDescriptionFrame];
    jobDescription.textColor = [UIColor grayColor];
    jobDescription.font = [UIFont systemFontOfSize:13];
    jobDescription.numberOfLines = 0;
    jobDescription.text = self.job.description;
    [jobDescription sizeToFit];
    [self addSubview:jobDescription];
    self.totalHeight += jobDescription.bounds.size.height + yOffset;
}

@end
