//
//  ArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "ArticleCell.h"

@interface ArticleCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation ArticleCell

-(void)drawCell
{
    float offset = 10;
    self.totalHeight = 0;
    CGRect imageFrame = CGRectMake(offset, offset, self.bounds.size.width/4,  100 - 2 * offset);
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = self.image;
    
    CGRect titleLabelRect = CGRectMake(imageView.bounds.size.width + imageView.bounds.origin.x + offset*1.7, offset*0.9, self.bounds.size.width - imageView.bounds.size.width + imageView.bounds.origin.x - offset * 2.3, self.height * 0.7);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.font = [UIFont boldSystemFontOfSize:13];
    titleLabel.numberOfLines = 0;
    titleLabel.text = self.title;
    if ([self.title length] < 110)
    {
        [titleLabel sizeToFit];
        self.totalHeight += titleLabel.bounds.size.height + titleLabelRect.origin.y + offset/2;
    }
    else
    {
        CGRect bigTitleLabelRect = CGRectMake(titleLabelRect.origin.x, offset*0.5, titleLabelRect.size.width, titleLabelRect.size.height);
        titleLabel.frame = bigTitleLabelRect;
        self.totalHeight += titleLabel.bounds.size.height + titleLabel.bounds.origin.y + offset/2;
    }
    [self addSubview:titleLabel];
    
    CGRect dateLabelRect = CGRectMake(titleLabelRect.origin.x, self.totalHeight, titleLabel.bounds.size.width, self.height - self.totalHeight- offset/2);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelRect];
    dateLabel.font = [UIFont boldSystemFontOfSize:11];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.text = self.date;
    if ([self.title length] < 110)
    [dateLabel sizeToFit];
    [self addSubview:dateLabel];
    [self addSubview:imageView];
}

@end
