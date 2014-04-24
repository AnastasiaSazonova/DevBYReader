//
//  MiddleJobCellTableViewCell.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MiddleJobCell.h"
#import "Job.h"

@implementation MiddleJobCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

    }
    return self;
}

-(void)setJob:(Job *)job
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
    
    CGRect companysNameFrame = CGRectMake(offset, offset/1.4 + totalHeight, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:13];
    companysName.numberOfLines = 0;
    companysName.text = job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
    totalHeight += companysName.bounds.size.height;
}

@end
