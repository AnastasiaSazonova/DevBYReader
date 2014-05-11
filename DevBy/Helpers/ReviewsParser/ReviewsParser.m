//
//  ReviewsParser.m
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "ReviewsParser.h"

@interface ReviewsParser()
{
    NSMutableArray *objects;
    NSInteger currentLevel;
    TextConverter *textConverter;
    
    NSArray *nodes;
}

- (NSMutableArray *)getReviewsWithArray:(NSArray *)reviewsNodes;

@end

@implementation ReviewsParser

- (id)init;
{
    self = [super init];
    if(self)
    {
        objects = [[NSMutableArray alloc] init];
        textConverter = [[TextConverter alloc] init];
    }
    return self;
}

- (NSMutableArray *)getReviewsWithUrl:(NSURL *)url andAddress:(NSString *)address;
{
    NSData *reviewsHtmlData = [NSData dataWithContentsOfURL:url];
    TFHpple *reviewsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:reviewsHtmlData]];
    nodes = [reviewsParser searchWithXPathQuery:address];
    
    objects = [self getReviewsWithArray:nodes];
    
    return objects;
}

- (NSMutableArray *)getReviewsWithArray:(NSArray *)reviewsNodes
{
    for(TFHppleElement *element in reviewsNodes)
    {
        Review *review = [[Review alloc] init];
        [objects addObject:review];
        
        TFHppleElement *reviewHead = [element firstChildWithClassName:@"clearfix green review-header"];
        if(reviewHead == nil)
        {
            reviewHead = [element firstChildWithClassName:@"clearfix red review-header"];
            review.color = [UIColor redColor];
        }
        
        NSString *username = [[[[reviewHead firstChildWithClassName:@"block data-user"] firstChildWithTagName:@"div"] firstChildWithTagName:@"a"] text];
        review.username = username;
        
        NSString *date = [[[reviewHead firstChildWithClassName:@"block data-time"] firstChildWithTagName:@"time"] text];
        review.date = date;
        
        TFHppleElement *textElement = [[[element firstChildWithClassName:@"review-body clearfix"] firstChildWithTagName:@"div"] firstChildWithClassName:@"text"];
        NSString *comment = [textConverter getText:textElement.children];
        review.comment = comment;
        
    }
    return objects;
}

@end
