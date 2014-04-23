//
//  NewsTableViewCell.m
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 3;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        self.timeLabel.font = [UIFont systemFontOfSize:9];
        
        self.thumbnailImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.thumbnailImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    
    frame = CGRectMake(boundsX + 10, 15, 70, 70);
    self.thumbnailImageView.frame = frame;
    
    frame = CGRectMake(boundsX + 90, 0, 200, 80);
    self.titleLabel.frame = frame;

    frame = CGRectMake(boundsX + 90, 70, 100, 15);
    self.timeLabel.frame = frame;
}

/*- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}*/

@end
