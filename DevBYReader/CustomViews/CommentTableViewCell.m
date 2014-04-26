//
//  CommentTableViewCell.m
//  DynamicCellHeightSample
//
//  Created by Admin on 4/20/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "CommentTableViewCell.h"

@interface CommentTableViewCell()
{
    CGFloat cellHeight;
}
@end

@implementation CommentTableViewCell

@synthesize authorLabel, textLabel, timeLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        cellHeight = 0;
        
        self.authorLabel = [[UILabel alloc] init];
        self.authorLabel.textAlignment = NSTextAlignmentLeft;
        self.authorLabel.font = [UIFont systemFontOfSize:FONT_SMALL_SIZE];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.font = [UIFont systemFontOfSize:FONT_SMALL_SIZE];
        
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.textLabel.numberOfLines = 0;
        self.textLabel.font = [UIFont systemFontOfSize:FONT_SMALL_SIZE];
        
        [self.contentView addSubview:self.authorLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

- (void)defineRects
{
    CGSize authorSize = [authorLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH / 2 - MARGIN_SMALL, NSIntegerMax)];
    CGSize timeSize = [timeLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH / 2 - MARGIN_SMALL, NSIntegerMax)];
    CGSize textSize = [textLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH - 2 * MARGIN_SMALL, NSIntegerMax)];
    
    cellHeight = authorSize.height + 3 * MARGIN_SMALL + textSize.height;
    
    authorLabel.frame = CGRectMake(MARGIN_SMALL, MARGIN_SMALL, authorSize.width, authorSize.height);
    timeLabel.frame = CGRectMake(CONTENT_WIDTH / 2, MARGIN_SMALL, CONTENT_WIDTH / 2 - MARGIN_SMALL, timeSize.height);
    textLabel.frame = CGRectMake(MARGIN_SMALL, authorSize.height + 2 * MARGIN_SMALL, textSize.width, textSize.height);
}

- (CGFloat)getHeight
{
    return cellHeight;
}

@end
