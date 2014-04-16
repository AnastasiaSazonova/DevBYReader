//
//  ArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

-(id)initWithHeight:(CGFloat)height title:(NSString *)title reuseIdentifier:(NSString *)reuseidentifier
{
    self = [super init];
    if (self)
    {
        float offset = 10;
        CGRect imageFrame = CGRectMake(offset, offset, self.bounds.size.width/4, height - 2 * offset);
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        imageView.backgroundColor = [UIColor yellowColor];
        
        float xPosition = imageFrame.origin.x + imageFrame.size.width + offset;
        CGRect titleLabelRect = CGRectMake(xPosition, 0, self.bounds.size.width - xPosition, self.bounds.size.height - 2 * offset);
        UILabel * titleLabel = [[UILabel alloc] initWithFrame: titleLabelRect];
        titleLabel.numberOfLines = 0;
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:15];
        [titleLabel sizeToFit];
        [imageView addSubview:titleLabel];
        
        CGRect postedDateRect = CGRectMake(xPosition, titleLabelRect.origin.y + titleLabel.bounds.size.height + offset/2, titleLabelRect.size.width, titleLabelRect.size.height);
        UILabel * postedDate = [[UILabel alloc] initWithFrame: postedDateRect];
        postedDate.font = [UIFont systemFontOfSize:12];
        postedDate.numberOfLines = 0;
        postedDate.text = @"10 апреля в 15:26";
        [postedDate sizeToFit];
        [imageView addSubview:postedDate];
        
        [self addSubview:imageView];
    }

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
