//
//  EventCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventCell.h"
#import "Constants.h"

@interface EventCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation EventCell


-(void)drawCell
{
    self.totalHeight = 0;
    
    CGRect nameLabelFrame = CGRectMake(offset*5, offset, self.bounds.size.width - offset*6, 0);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:ECNameLabelFont];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.title;
    [nameLabel sizeToFit];
    [self addSubview:nameLabel];
    self.totalHeight += nameLabel.bounds.size.height + offset + offset/3;
    
    CGRect descriptionLabelFrame = CGRectMake(offset*5, self.totalHeight, self.bounds.size.width - offset*6, 0);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelFrame];
    descriptionLabel.font = [UIFont systemFontOfSize:ECDescriptionLabelFont];
    descriptionLabel.textColor = [UIColor darkGrayColor];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.description;
    [descriptionLabel sizeToFit];
    [self addSubview:descriptionLabel];
    self.totalHeight += descriptionLabel.bounds.size.height + offset;
    
    CGRect dateLabelFrame = CGRectMake(halfOffset, self.totalHeight/2 - offset*1.6, 0, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:ECDateLabelFont];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.text = self.day;
    [dateLabel sizeToFit];
    dateLabel.frame = CGRectMake(dateLabel.frame.origin.x, dateLabel.frame.origin.y, offset*4, dateLabel.frame.size.height);
    [self addSubview:dateLabel];
    
    CGRect dayLabelFrame = CGRectMake(halfOffset, self.totalHeight/2 - halfOffset, 0, 0);
    UILabel * dayLabel = [[UILabel alloc] initWithFrame:dayLabelFrame];
    dayLabel.font = [UIFont systemFontOfSize:ECDayLabeFont];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.textColor = [UIColor darkGrayColor];
    dayLabel.text = self.month;
    [dayLabel sizeToFit];
    dayLabel.frame = CGRectMake(dayLabel.frame.origin.x, dayLabel.frame.origin.y, offset*4, dayLabel.frame.size.height);
    [self addSubview:dayLabel];
    
    CGRect weekDayLabelFrame = CGRectMake(halfOffset, self.totalHeight/2 + halfOffset, 0, 0);
    UILabel * weekDayLabel = [[UILabel alloc] initWithFrame:weekDayLabelFrame];
    weekDayLabel.font = [UIFont systemFontOfSize:ECWeekLabelFont];
    weekDayLabel.textAlignment = NSTextAlignmentCenter;
    weekDayLabel.textColor = [UIColor darkGrayColor];
    weekDayLabel.text = self.dayOfWeek;
    [weekDayLabel sizeToFit];
    weekDayLabel.frame = CGRectMake(weekDayLabel.frame.origin.x, weekDayLabel.frame.origin.y, offset*4, weekDayLabel.frame.size.height);
    [self addSubview:weekDayLabel];
}

@end
