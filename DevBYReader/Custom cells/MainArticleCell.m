//
//  MainArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MainArticleCell.h"

@implementation MainArticleCell

-(id)initWithHeight:(CGFloat)height title:(NSString *)title reuseIdentifier:(NSString *)identifier
{
    self = [super init];
    if (self)
    {
        CGRect imageFrame = CGRectMake(0, 0, self.bounds.size.width, height);
        float textOffset = 10;
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        imageView.backgroundColor = [UIColor grayColor];
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:imageFrame];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont  systemFontOfSize:17];
        titleLabel.numberOfLines = 0;
        titleLabel.text = title;
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake(titleLabel.frame.origin.x + textOffset/2, imageFrame.size.height - titleLabel.bounds.size.height - textOffset, self.bounds.size.width - textOffset, titleLabel.frame.size.height);
        [imageView addSubview:titleLabel];
        [self addSubview:imageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
