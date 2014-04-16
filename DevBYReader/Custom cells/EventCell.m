//
//  EventCell.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventCell.h"

@implementation EventCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        float offset = 20.0f;
        CGRect dateLabelFrame = CGRectMake(offset, self.bounds.size.height/2 + 10, 50, 50);
        UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
        dateLabel.font = [UIFont systemFontOfSize:28];
        dateLabel.text = @"15";
        [dateLabel sizeToFit];
        [self addSubview:dateLabel];
        
        CGRect dayLabelFrame = CGRectMake(offset/2, self.bounds.size.height/2 + offset*1.5 + 10, 50, 50);
        UILabel * dayLabel = [[UILabel alloc] initWithFrame:dayLabelFrame];
        dayLabel.font = [UIFont systemFontOfSize:17];
        dayLabel.textColor = [UIColor grayColor];
        dayLabel.text = @"апрель";
        [dayLabel sizeToFit];
        [self addSubview:dayLabel];
        
        CGRect weekDayLabelFrame = CGRectMake(offset*1.3, self.bounds.size.height/2 + offset*2.5 + 10, 50, 50);
        UILabel * weekDayLabel = [[UILabel alloc] initWithFrame:weekDayLabelFrame];
        weekDayLabel.font = [UIFont systemFontOfSize:17];
        weekDayLabel.textColor = [UIColor grayColor];
        weekDayLabel.text = @"ВТ";
        [weekDayLabel sizeToFit];
        [self addSubview:weekDayLabel];
        
        CGRect nameLabelFrame = CGRectMake(offset*4, self.bounds.size.height/2 - offset/2, self.bounds.size.width - offset*5, 80);
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.numberOfLines = 0;
        nameLabel.text = @"Frontend Dev Conf’14 - конференция frontend разработчиков и UI-специалистов.";
        [nameLabel sizeThatFits:CGSizeMake(self.bounds.size.width - 3 * offset, self.bounds.size.height/2)];
        [self addSubview:nameLabel];
        
        CGRect descriptionLabelFrame = CGRectMake(offset*4, offset/2 + nameLabel.bounds.size.height, self.bounds.size.width - offset*5, 50);
        UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelFrame];
        descriptionLabel.font = [UIFont systemFontOfSize:12];
        descriptionLabel.textColor = [UIColor grayColor];
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.text = @"18 апреля 18:00 Минск. Организатор: MapsWithMe.";
        [nameLabel sizeThatFits:CGSizeMake(self.bounds.size.width - 3 * offset, self.bounds.size.height/4)];
        [self addSubview:descriptionLabel];
        
    }
    return self;
}

@end
