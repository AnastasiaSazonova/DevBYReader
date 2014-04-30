//
//  EventCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventCell.h"
<<<<<<< HEAD
=======
#import "Constants.h"
>>>>>>> sazonova

@interface EventCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation EventCell


-(void)drawCell
{
<<<<<<< HEAD
    float offset = 20.0f;
    self.totalHeight = 0;
    
    CGRect nameLabelFrame = CGRectMake(offset*4, offset, self.bounds.size.width - offset*5, 80);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:14];
=======
    self.totalHeight = 0;
    
    CGRect nameLabelFrame = CGRectMake(offset*4, offset, self.bounds.size.width - offset*5, 0);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:ECNameLabelFont];
>>>>>>> sazonova
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.title;
    [nameLabel sizeToFit];
    [self addSubview:nameLabel];
    self.totalHeight += nameLabel.bounds.size.height + offset + offset/3;
    
<<<<<<< HEAD
    CGRect descriptionLabelFrame = CGRectMake(offset*4, self.totalHeight, self.bounds.size.width - offset*5, 50);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelFrame];
    descriptionLabel.font = [UIFont systemFontOfSize:12];
=======
    CGRect descriptionLabelFrame = CGRectMake(offset*4, self.totalHeight, self.bounds.size.width - offset*5, 0);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelFrame];
    descriptionLabel.font = [UIFont systemFontOfSize:ECDescriptionLabelFont];
>>>>>>> sazonova
    descriptionLabel.textColor = [UIColor darkGrayColor];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.description;
    [descriptionLabel sizeToFit];
    [self addSubview:descriptionLabel];
    self.totalHeight += descriptionLabel.bounds.size.height + offset;
    
<<<<<<< HEAD
    CGRect dateLabelFrame = CGRectMake(offset*1.2, self.totalHeight/2 - offset*1.6, 50, 50);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:22];
=======
    CGRect dateLabelFrame = CGRectMake(offset*1.2, self.totalHeight/2 - offset*1.6, 0, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:ECDateLabelFont];
>>>>>>> sazonova
    dateLabel.text = self.day;
    [dateLabel sizeToFit];
    [self addSubview:dateLabel];
    
<<<<<<< HEAD
    CGRect dayLabelFrame = CGRectMake(offset/2, self.totalHeight/2 - offset/2, 50, 50);
    UILabel * dayLabel = [[UILabel alloc] initWithFrame:dayLabelFrame];
    dayLabel.font = [UIFont systemFontOfSize:17];
=======
    CGRect dayLabelFrame = CGRectMake(halfOffset, self.totalHeight/2 - halfOffset, 0, 0);
    UILabel * dayLabel = [[UILabel alloc] initWithFrame:dayLabelFrame];
    dayLabel.font = [UIFont systemFontOfSize:ECDayLabeFont];
>>>>>>> sazonova
    dayLabel.textColor = [UIColor darkGrayColor];
    dayLabel.text = self.month;
    [dayLabel sizeToFit];
    [self addSubview:dayLabel];
    
<<<<<<< HEAD
    CGRect weekDayLabelFrame = CGRectMake(offset*1.3, self.totalHeight/2 + offset/2, 50, 50);
    UILabel * weekDayLabel = [[UILabel alloc] initWithFrame:weekDayLabelFrame];
    weekDayLabel.font = [UIFont systemFontOfSize:17];
=======
    CGRect weekDayLabelFrame = CGRectMake(offset*1.3, self.totalHeight/2 + halfOffset, 0, 0);
    UILabel * weekDayLabel = [[UILabel alloc] initWithFrame:weekDayLabelFrame];
    weekDayLabel.font = [UIFont systemFontOfSize:ECWeekLabelFont];
>>>>>>> sazonova
    weekDayLabel.textColor = [UIColor darkGrayColor];
    weekDayLabel.text = self.dayOfWeek;
    [weekDayLabel sizeToFit];
    [self addSubview:weekDayLabel];
}

@end
