//
//  EventsTableViewCell.m
//  DevBy
//
//  Created by Admin on 4/10/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "EventsTableViewCell.h"

@interface EventsTableViewCell()
{
    CGFloat cellHeight;
}
@end

@implementation EventsTableViewCell

@synthesize titleLabel, descriptionLabel, dateLabel, dateDetLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        cellHeight = 0;
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = 0;
        titleLabel.font = [UIFont systemFontOfSize:16];
        
        descriptionLabel = [[UILabel alloc] init];
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.font = [UIFont systemFontOfSize:12];
        
        dateLabel = [[UILabel alloc] init];
        dateLabel.font = [UIFont systemFontOfSize:20];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        
        dateDetLabel = [[UILabel alloc] init];
        dateDetLabel.font = [UIFont systemFontOfSize:12];
        dateDetLabel.textAlignment = NSTextAlignmentCenter;
        dateDetLabel.numberOfLines = 0;
        
        /*dateLabel.backgroundColor = [UIColor greenColor];
        dateDetLabel.backgroundColor = [UIColor brownColor];
        titleLabel.backgroundColor = [UIColor blueColor];
        descriptionLabel.backgroundColor = [UIColor orangeColor];*/
        
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:dateLabel];
        [self.contentView addSubview:dateDetLabel];
        [self.contentView addSubview:descriptionLabel];
    }
    return self;
}

- (void)defineRects
{
    CGFloat alignmentMarginLeftSide = 0;
    CGFloat alignmentMarginRightSide = 0;
        
    CGSize dateSize = [dateLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH / 4 - MARGIN_SMALL, NSIntegerMax)];
    CGSize dateDetSize = [dateDetLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH / 4 - MARGIN_SMALL, NSIntegerMax)];
    CGSize titleSize = [titleLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH * 3 / 4 - 2 * MARGIN_SMALL, NSIntegerMax)];
    CGSize descriptionSize = [descriptionLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH * 3 / 4 - 2 * MARGIN_SMALL, NSIntegerMax)];

    if(dateSize.height + dateDetSize.height < titleSize.height + descriptionSize.height + MARGIN_SMALL)
    {
        alignmentMarginLeftSide = ((titleSize.height + descriptionSize.height + MARGIN_SMALL) - (dateSize.height + dateDetSize.height)) / 2;
        cellHeight = titleSize.height + descriptionSize.height + 3 * MARGIN_SMALL;
    }
    else if (dateSize.height + dateDetSize.height > titleSize.height + descriptionSize.height + MARGIN_SMALL)
    {
        alignmentMarginRightSide = ((dateSize.height + dateDetSize.height) - (titleSize.height + descriptionSize.height + MARGIN_SMALL)) / 2;
        cellHeight = dateSize.height + dateDetSize.height + 2 * MARGIN_SMALL;
    }
    if(cellHeight == 0)
    {
        cellHeight = dateSize.height + dateDetSize.height + 2 * MARGIN_SMALL;
    }

    dateLabel.frame = CGRectMake(MARGIN_SMALL, alignmentMarginLeftSide + MARGIN_SMALL, CONTENT_WIDTH / 4 - MARGIN_SMALL, dateSize.height);
    dateDetLabel.frame = CGRectMake(MARGIN_SMALL, dateLabel.frame.origin.y + dateLabel.frame.size.height, CONTENT_WIDTH / 4 - MARGIN_SMALL, dateDetSize.height);
    titleLabel.frame = CGRectMake(dateLabel.frame.size.width + 2 * MARGIN_SMALL, alignmentMarginRightSide + MARGIN_SMALL, CONTENT_WIDTH * 3 / 4 - 2 * MARGIN_SMALL, titleSize.height);
    descriptionLabel.frame = CGRectMake(dateLabel.frame.size.width + 2 * MARGIN_SMALL, titleLabel.frame.origin.y + titleLabel.frame.size.height + MARGIN_SMALL, CONTENT_WIDTH * 3 / 4 - 2 * MARGIN_SMALL, descriptionSize.height);
}

- (CGFloat)getHeight
{
    return cellHeight;
}

@end
