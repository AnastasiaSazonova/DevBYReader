//
//  MainArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MainArticleCell.h"
#import "Constants.h"

@implementation MainArticleCell

-(void)drawCell
{
    CGRect imageFrame = CGRectMake(0, 0, self.bounds.size.width, self.height);
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = self.image;
    
    CGRect opacityFrame = CGRectMake(0, self.height*0.65, self.bounds.size.width, self.height*0.35);
    UIImageView * opacity = [[UIImageView alloc] initWithFrame:opacityFrame];
    opacity.image = [UIImage imageNamed:@"dark_opacity"];
    [imageView addSubview:opacity];
    
    CGRect titleLabelRect = CGRectMake(halfOffset/2, opacityFrame.origin.y, self.bounds.size.width - halfOffset, self.height*0.35);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:MACTitleFont];
    titleLabel.numberOfLines = 0;
    titleLabel.text = self.title;
    [imageView addSubview:titleLabel];
    [self addSubview:imageView];
}

@end
