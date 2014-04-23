//
//  EventCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventCell.h"

@interface EventCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation EventCell


-(void)drawCell
{
    float offset = 20.0f;
    self.totalHeight = 0;
    
    CGRect nameLabelFrame = CGRectMake(offset*4, offset, self.bounds.size.width - offset*5, 80);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.title;
    [nameLabel sizeToFit];
    [self addSubview:nameLabel];
    self.totalHeight += nameLabel.bounds.size.height + offset + offset/3;
    
    CGRect descriptionLabelFrame = CGRectMake(offset*4, self.totalHeight, self.bounds.size.width - offset*5, 50);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelFrame];
    descriptionLabel.font = [UIFont systemFontOfSize:12];
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.description;
    [descriptionLabel sizeToFit];
    [self addSubview:descriptionLabel];
    self.totalHeight += descriptionLabel.bounds.size.height + offset;
    
    CGRect dateLabelFrame = CGRectMake(offset*1.2, self.totalHeight/2 - offset*1.6, 50, 50);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:22];
    dateLabel.text = self.day;
    [dateLabel sizeToFit];
    [self addSubview:dateLabel];
    
    CGRect dayLabelFrame = CGRectMake(offset/2, self.totalHeight/2 - offset/2, 50, 50);
    UILabel * dayLabel = [[UILabel alloc] initWithFrame:dayLabelFrame];
    dayLabel.font = [UIFont systemFontOfSize:17];
    dayLabel.textColor = [UIColor grayColor];
    dayLabel.text = self.month;
    [dayLabel sizeToFit];
    [self addSubview:dayLabel];
    
    CGRect weekDayLabelFrame = CGRectMake(offset*1.3, self.totalHeight/2 + offset/2, 50, 50);
    UILabel * weekDayLabel = [[UILabel alloc] initWithFrame:weekDayLabelFrame];
    weekDayLabel.font = [UIFont systemFontOfSize:17];
    weekDayLabel.textColor = [UIColor grayColor];
    weekDayLabel.text = self.dayOfWeek;
    [weekDayLabel sizeToFit];
    [self addSubview:weekDayLabel];
}

@end
