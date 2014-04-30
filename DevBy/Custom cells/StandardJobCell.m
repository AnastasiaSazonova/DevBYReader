//
//  StandardJobCell.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "StandardJobCell.h"
<<<<<<< HEAD
=======
#import "Job.h"
#import "Constants.h"
>>>>>>> sazonova

@interface StandardJobCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation StandardJobCell

<<<<<<< HEAD
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawCell{}

=======
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
}

>>>>>>> sazonova
@end
