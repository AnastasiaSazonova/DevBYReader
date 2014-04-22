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

@property(nonatomic, strong)NSString * title;

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

-(void)setJob:(PremiumJob *)job
{
    float offset = 20.0f;
    float totalHeight = 0;
    CGRect jobTitleFrame = CGRectMake(offset, offset/2, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * jobTitle = [[UILabel alloc] initWithFrame:jobTitleFrame];
    jobTitle.font = [UIFont systemFontOfSize:16];
    jobTitle.numberOfLines = 0;
    jobTitle.text = job.title;
    [jobTitle sizeToFit];
    [self addSubview:jobTitle];
    totalHeight += jobTitle.bounds.size.height;
    
    CGRect companysNameFrame = CGRectMake(offset, offset/2 + totalHeight, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:13];
    companysName.numberOfLines = 0;
    companysName.text = job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
    totalHeight += companysName.bounds.size.height;
    
    CGRect jobDescriptionFrame = CGRectMake(offset, offset + totalHeight, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * jobDescription = [[UILabel alloc] initWithFrame:jobDescriptionFrame];
    jobDescription.textColor = [UIColor grayColor];
    jobDescription.font = [UIFont systemFontOfSize:13];
    jobDescription.numberOfLines = 0;
    jobDescription.text = job.description;
    [jobDescription sizeToFit];
    [self addSubview:jobDescription];
    totalHeight += jobDescription.bounds.size.height;
}

@end
