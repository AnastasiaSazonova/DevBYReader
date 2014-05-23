//
//  ArticleCell.m
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "ArticleCell.h"
#import "Constants.h"
#import "UIImageView+AFNetworking.h"

@implementation ArticleCell


- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

-(void)drawCell
{
    float padding = 3.0f;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 80);
    
    UITextView* titleView = [[UITextView alloc]initWithFrame:CGRectMake(5, self.bounds.origin.y, self.bounds.size.width - 80, 80)];
    titleView.font = [UIFont boldSystemFontOfSize:ACTitleFont];
    titleView.text = self.title;
    titleView.editable = NO;
    titleView.userInteractionEnabled = NO;
    
    
    CGFloat heightTitle = [self textViewHeightForAttributedText:titleView.attributedText andWidth:titleView.bounds.size.width];
    titleView.frame = CGRectMake(titleView.frame.origin.x, titleView.frame.origin.y, titleView.frame.size.width, heightTitle);
    titleView.scrollEnabled = NO;
    
    [self addSubview:titleView];
    
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, titleView.frame.origin.y + titleView.frame.size.height, titleView.frame.size.width - 6, 15)];
    dateLabel.font = [UIFont boldSystemFontOfSize:ACDateLabelFont];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.text = self.date;
    
    [self addSubview:dateLabel];
    
    self.height =  titleView.frame.size.height + dateLabel.frame.size.height + padding;
    
    if(self.height < 70)
        self.height = 70;
        
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, self.height);
    
    if (self.imageUrl)
    {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.origin.x + self.frame.size.width - 10 - 60, self.center.y - 30, 60,  60)];
        [imageView setImageWithURL:[NSURL URLWithString:self.imageUrl]];
        [self addSubview:imageView];
    }
    else
    {
        titleView.frame = CGRectMake(10, titleView.bounds.origin.y, self.bounds.size.width - 10 , titleView.bounds.size.height);
        dateLabel.frame = CGRectMake(10 + 5, titleView.bounds.origin.y + titleView.bounds.size.height, dateLabel.bounds.size.width, dateLabel.bounds.size.height);
    }
}

@end
