//
//  CustomCell.m
//  DevBy
//
//  Created by Anastasia on 5/2/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CustomCell.h"
#import "ArticleCell.h"
#import "CommentsCell.h"
#import "MainArticleCell.h"
#import "EventCell.h"
#import "PremiumJobCell.h"
#import "MiddleJobCell.h"
#import "StandardJobCell.h"
#import "FeedbackCell.h"
#import "Constants.h"

@implementation CustomCell

+(CustomCell *)customCellWithType:(CustomCellType)type
{
    switch (type)
    {
        case articleCellType:
            return [[ArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:articleCellIdentifier];
            break;
        case mainArticleCellType:
            return [[MainArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainArticleCellIdentifier];
            break;
        case eventCellType:
            return [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:eventCellIdentifier];
            break;
        case premiumJobCellType:
            return [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:premiumJobCellIdentifier];
            break;
        case middleJobCellType:
            return [[MiddleJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:middleJobCellIdentifier];
            break;
        case standardJobCellType:
            return [[StandardJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:standardJobCellIdentifier];
            break;
        case feedBackCellType:
            return [[FeedbackCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedbackCellIdentifier];
            break;
        case commentCellType:
            return [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCellIdentifier];
            break;
            
        default:
            return nil;
            break;
    }
}

-(void)drawCell
{
    return;
}

-(void)drawCellWithOffset:(int)offset
{
    return;
}

@end
