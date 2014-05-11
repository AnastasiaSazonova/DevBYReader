//
//  Review.m
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "Review.h"

@implementation Review

//@synthesize author, date, text, level, color;

- (id)init
{
    self = [super init];
    if(self)
    {
        self.color = [UIColor blackColor];
    }
    return self;
}

@end
