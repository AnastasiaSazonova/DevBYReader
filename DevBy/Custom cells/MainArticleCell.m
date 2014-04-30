//
//  MainArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "MainArticleCell.h"
<<<<<<< HEAD
=======
#import "Constants.h"

#define MAX_ROWS 4
>>>>>>> sazonova

@implementation MainArticleCell

-(void)drawCell
{
<<<<<<< HEAD
    float textOffset = 10.0f;
=======
>>>>>>> sazonova
    CGRect imageFrame = CGRectMake(0, 0, self.bounds.size.width, self.height);
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    imageView.image = self.image;
    
<<<<<<< HEAD
    CGRect opacityFrame = CGRectMake(0, self.height*0.65, self.bounds.size.width, self.height*0.35);
=======
    CGRect titleLabelRect = CGRectMake(halfOffset / 2, 0, self.bounds.size.width - halfOffset, NSIntegerMax);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.font = [UIFont boldSystemFontOfSize:MACTitleFont];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.numberOfLines = MAX_ROWS;
    titleLabel.text = self.title;
    [titleLabel sizeToFit];
    titleLabel.frame = CGRectMake(halfOffset / 2, self.height - titleLabel.frame.size.height - halfOffset, titleLabel.frame.size.width, titleLabel.frame.size.height + halfOffset);
    
    CGRect opacityFrame = CGRectMake(0, titleLabel.frame.origin.y, self.bounds.size.width, titleLabel.frame.size.height);
>>>>>>> sazonova
    UIImageView * opacity = [[UIImageView alloc] initWithFrame:opacityFrame];
    opacity.image = [UIImage imageNamed:@"dark_opacity"];
    [imageView addSubview:opacity];
    
<<<<<<< HEAD
    CGRect titleLabelRect = CGRectMake(textOffset/2, opacityFrame.origin.y, self.bounds.size.width - textOffset, self.height*0.35);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:titleLabelRect];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    titleLabel.numberOfLines = 0;
    titleLabel.text = self.title;
=======
>>>>>>> sazonova
    [imageView addSubview:titleLabel];
    [self addSubview:imageView];
}

@end
