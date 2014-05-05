//
//  ArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "ArticleCell.h"
#import "Constants.h"

@interface ArticleCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation ArticleCell

-(void)drawCell
{
    self.totalHeight = 0;
    CGRect imageFrame = CGRectMake(halfOffset, halfOffset, self.bounds.size.width/4,  self.height - 2 * halfOffset);
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = self.image;
    
    CGRect titleLabelRect = CGRectMake(imageView.bounds.size.width + imageView.bounds.origin.x + halfOffset*1.7, halfOffset*0.9, self.bounds.size.width - imageView.bounds.size.width + imageView.bounds.origin.x - halfOffset * 2.3, self.height * 0.7);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.font = [UIFont boldSystemFontOfSize:ACTitleFont];
    titleLabel.numberOfLines = 0;
    titleLabel.text = self.title;
    if ([self.title length] < ACTitleLabelMaxLength)
    {
        [titleLabel sizeToFit];
        self.totalHeight += titleLabel.bounds.size.height + titleLabelRect.origin.y + halfOffset/2;
    }
    else
    {
        CGRect bigTitleLabelRect = CGRectMake(titleLabelRect.origin.x, halfOffset*0.5, titleLabelRect.size.width, titleLabelRect.size.height);
        titleLabel.frame = bigTitleLabelRect;
        self.totalHeight += titleLabel.bounds.size.height + titleLabel.bounds.origin.y + halfOffset/2;
    }
    [self addSubview:titleLabel];
    
    CGRect dateLabelRect = CGRectMake(titleLabelRect.origin.x, self.totalHeight, titleLabel.bounds.size.width, self.height - self.totalHeight- halfOffset/2);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelRect];
    dateLabel.font = [UIFont boldSystemFontOfSize:ACDateLabelFont];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.text = self.date;
    if ([self.title length] < ACTitleLabelMaxLength)
    {
        [dateLabel sizeToFit];
    }
    [self addSubview:dateLabel];
    [self addSubview:imageView];
}

@end
