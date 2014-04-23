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
        dateLabel.font = [UIFont systemFontOfSize:14];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        
        dateDetLabel = [[UILabel alloc] init];
        dateDetLabel.font = [UIFont systemFontOfSize:12];
        dateDetLabel.textAlignment = NSTextAlignmentCenter;
        dateDetLabel.numberOfLines = 0;
        
        dateLabel.backgroundColor = [UIColor greenColor];
        dateDetLabel.backgroundColor = [UIColor brownColor];
        titleLabel.backgroundColor = [UIColor blueColor];
        descriptionLabel.backgroundColor = [UIColor orangeColor];
        
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
        
    CGSize dateSize = [dateLabel sizeThatFits:CGSizeMake(CELL_CONTENT_WIDTH / 3 - CELL_CONTENT_MARGIN, NSIntegerMax)];
    CGSize dateDetSize = [dateDetLabel sizeThatFits:CGSizeMake(CELL_CONTENT_WIDTH / 3 - CELL_CONTENT_MARGIN, NSIntegerMax)];
    CGSize titleSize = [titleLabel sizeThatFits:CGSizeMake(CELL_CONTENT_WIDTH * 2 / 3 - 2 * CELL_CONTENT_MARGIN, NSIntegerMax)];
    CGSize descriptionSize = [descriptionLabel sizeThatFits:CGSizeMake(CELL_CONTENT_WIDTH * 2 / 3 - 2 * CELL_CONTENT_MARGIN, NSIntegerMax)];

    if(dateSize.height + dateDetSize.height < titleSize.height + descriptionSize.height + CELL_CONTENT_MARGIN)
    {
        alignmentMarginLeftSide = ((titleSize.height + descriptionSize.height + CELL_CONTENT_MARGIN) - (dateSize.height + dateDetSize.height)) / 2;
        cellHeight = titleSize.height + descriptionSize.height + 3 * CELL_CONTENT_MARGIN;
    }
    else if (dateSize.height + dateDetSize.height > titleSize.height + descriptionSize.height + CELL_CONTENT_MARGIN)
    {
        alignmentMarginRightSide = ((dateSize.height + dateDetSize.height) - (titleSize.height + descriptionSize.height + CELL_CONTENT_MARGIN)) / 2;
        cellHeight = dateSize.height + dateDetSize.height + 2 * CELL_CONTENT_MARGIN;
    }
    if(cellHeight == 0)
    {
        cellHeight = dateSize.height + dateDetSize.height + 2 * CELL_CONTENT_MARGIN;
    }

    dateLabel.frame = CGRectMake(CELL_CONTENT_MARGIN, alignmentMarginLeftSide + CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH / 3 - CELL_CONTENT_MARGIN, dateSize.height);
    dateDetLabel.frame = CGRectMake(CELL_CONTENT_MARGIN, dateLabel.frame.origin.y + dateLabel.frame.size.height, CELL_CONTENT_WIDTH / 3 - CELL_CONTENT_MARGIN, dateDetSize.height);
    titleLabel.frame = CGRectMake(dateLabel.frame.size.width + 2 * CELL_CONTENT_MARGIN, alignmentMarginRightSide + CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH * 2 / 3 - 2 * CELL_CONTENT_MARGIN, titleSize.height);
    descriptionLabel.frame = CGRectMake(dateLabel.frame.size.width + 2 * CELL_CONTENT_MARGIN, titleLabel.frame.origin.y + titleLabel.frame.size.height + CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH * 2 / 3 - 2 * CELL_CONTENT_MARGIN, descriptionSize.height);
}

- (CGFloat)getHeight
{
    return cellHeight;
}

@end
