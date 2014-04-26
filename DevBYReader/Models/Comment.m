//
//  Comment.m
//  NestedCommentsSample
//
//  Created by Admin on 4/19/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "Comment.h"

@implementation Comment

@synthesize author, time, text, depth;

+ (id)dataObjectWithAuthor:(NSString *)author_ andTime:(NSString *)time_ andText:(NSString *)text_ andDepth:(NSInteger)depth_
{
    return [[self alloc] initWithAuthor:author_ andTime:time_ andText:text_ andDepth:depth_];
}

- (id)initWithAuthor:(NSString *)author_ andTime:(NSString *)time_ andText:(NSString *)text_ andDepth:(NSInteger)depth_
{
    self = [super init];
    if(self)
    {
        author = author_;
        time = time_;
        text = text_;
        depth = depth_;
    }
    return self;
}

@end
