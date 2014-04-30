//
//  MiddleJobCellTableViewCell.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MiddleJobCell.h"
#import "Job.h"
<<<<<<< HEAD
#import "MiddleJob.h"

@implementation MiddleJobCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

    }
    return self;
}

-(void)drawCell
{
    float offset = 20.0f;
    float totalHeight = 0;
    CGRect jobTitleFrame = CGRectMake(offset, offset/2, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * jobTitle = [[UILabel alloc] initWithFrame:jobTitleFrame];
    jobTitle.font = [UIFont systemFontOfSize:16];
=======
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
>>>>>>> sazonova
    jobTitle.numberOfLines = 0;
    jobTitle.text = self.job.name;
    [jobTitle sizeToFit];
    [self addSubview:jobTitle];
<<<<<<< HEAD
    totalHeight += jobTitle.bounds.size.height;
    
    CGRect companysNameFrame = CGRectMake(offset, offset/1.4 + totalHeight, self.frame.size.width - 2.5*offset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:13];
=======
    self.totalHeight += jobTitle.bounds.size.height + halfOffset;
    
    CGRect companysNameFrame = CGRectMake(offset, self.totalHeight, self.frame.size.width - 5*halfOffset, self.frame.size.height/2);
    UILabel * companysName = [[UILabel alloc] initWithFrame:companysNameFrame];
    companysName.font = [UIFont boldSystemFontOfSize:MJCompanysNameFont];
>>>>>>> sazonova
    companysName.numberOfLines = 0;
    companysName.text = self.job.companysName;
    [companysName sizeToFit];
    [self addSubview:companysName];
<<<<<<< HEAD
    totalHeight += companysName.bounds.size.height;
=======
    self.totalHeight += companysName.bounds.size.height + halfOffset;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, halfOffset, self.totalHeight)];
    view.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:122.0/255.0 alpha:0.4];
    [self addSubview:view];
>>>>>>> sazonova
}
@end
