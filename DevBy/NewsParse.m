//
//  NewsParse.m
//  DevBy
//
//  Created by Admin on 22.05.14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "NewsParse.h"

@implementation NewsParse

- (void) parseFromDictionary:(NSDictionary*) dictionary
{
    for(NSString* key in dictionary.allKeys)
    {
        NSLog(@"%@", key);
        [ self startParseWithObject:[dictionary objectForKey:key]];
    }
}

-(void)startParseWithObject:(NSDictionary*)dictionary
{
    for(NSString* key in dictionary.allKeys)
    {
        if ([key rangeOfString:@"title_link" options:NSCaseInsensitiveSearch].length > 0)
        {
            NSLog(@"string contains hello %@",[dictionary objectForKey:key]);
            continue;
        }
        if ([key rangeOfString:@"img" options:NSCaseInsensitiveSearch].length > 0)
        {
            NSLog(@"img %@",[dictionary objectForKey:key]);
            continue;
        }
        if ([key rangeOfString:@"title_link_url" options:NSCaseInsensitiveSearch].length > 0)
        {
            NSLog(@"title_link_url %@", [dictionary objectForKey:key]);
            continue;
        }
        if ([key rangeOfString:@"time" options:NSCaseInsensitiveSearch].length > 0)
        {
            NSLog(@"string contains %@",[[dictionary objectForKey:key]objectForKey:@"text"]);
            continue;
        }
        if([[dictionary objectForKey:key] isKindOfClass:NSDictionary.class])
            [self startParseWithObject:[dictionary objectForKey:key]];
    }
}

@end