//
//  MainArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MainArticleCell.h"
#import "Constants.h"
#import "UIImageView+AFNetworking.h"

#define MAX_ROWS 4

@implementation MainArticleCell

-(void)drawCell
{
    CGRect imageFrame = CGRectMake(0, 0, self.bounds.size.width, self.height);
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    [imageView setImageWithURL:[NSURL URLWithString:self.imageUrl]];
    
    CGRect titleLabelRect = CGRectMake(halfOffset / 2, 0, self.bounds.size.width - halfOffset, NSIntegerMax);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.font = [UIFont boldSystemFontOfSize:MACTitleFont];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.numberOfLines = MAX_ROWS;
    titleLabel.text = self.title;
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(halfOffset / 2, self.height - titleLabel.frame.size.height - halfOffset, titleLabel.frame.size.width, titleLabel.frame.size.height + halfOffset);
    
    CGRect opacityFrame = CGRectMake(0, titleLabel.frame.origin.y, self.bounds.size.width, titleLabel.frame.size.height);
    UIImageView * opacity = [[UIImageView alloc] initWithFrame:opacityFrame];
    opacity.image = [UIImage imageNamed:@"dark_opacity"];
    [imageView addSubview:opacity];
    
    [imageView addSubview:titleLabel];
    [self addSubview:imageView];
}

@end
