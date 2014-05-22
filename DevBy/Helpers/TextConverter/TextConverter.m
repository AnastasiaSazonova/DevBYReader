//
//  TextConverter.m
//  HTMLParsing
//
//  Created by Admin on 5/5/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "TextConverter.h"

@implementation TextConverter

- (NSData *)clearHtmlData:(NSData *)data
{
    NSString *htmlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    return [htmlString dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)getText:(NSArray *)htmlElements
{
    NSMutableString *result = [[NSMutableString alloc] init];
    
    NSInteger i = 0;
    NSString *s;
    @try{
    for(TFHppleElement *item in htmlElements)
    {
        i++;
        s = item.tagName;
        if([item.tagName isEqualToString:@"p"] && [item text] != nil)   // PRIMMARY FOR COMMENTS
        {
            for(TFHppleElement *child in item.children)
            {
                if([child.tagName isEqualToString:@"text"] && child.text != nil)         //text
                    [result appendFormat:@"%@", [child content]];
                else if([child.tagName isEqualToString:@"br"])      //br
                    [result appendString:@"\n"];
                else if([child.tagName isEqualToString:@"a"])       //a
                    [result appendString:[child text]];
                else if([child.tagName isEqualToString:@"strong"])  //strong
                    [result appendFormat:@"%@", [child text]];
            }
            [result appendString:@"\n"];
        }
        else if([item.tagName isEqualToString:@"text"] && ([item content] != nil))       // SIMPLE TEXT
            [result appendFormat:@"%@", [item content]];
        else if([item.tagName isEqualToString:@"strong"])
        {
            for(TFHppleElement *child in item.children)
            {
                if([child.tagName isEqualToString:@"text"])
                {
                    [result appendFormat:@"%@", [child content]];
                }
            }
        }
        else if([item.tagName isEqualToString:@"h2"])
            [result appendFormat:@"%@\n", [item text]];
        else if([item.tagName isEqualToString:@"ul"])
        {            
            for(TFHppleElement *child in item.children)
            {
                if([child.tagName isEqualToString:@"li"])
                    [result appendFormat:@"%@\n", [child text]];
            }
        }
        else if([item.tagName isEqualToString:@"span"])
        {
            for(TFHppleElement *child in item.children)
            {
                if([child.tagName isEqualToString:@"text"])
                    [result appendFormat:@"%@", [child content]];
            }
        }
        else if([item.tagName isEqualToString:@"a"])
        {
            [result appendFormat:@"%@", [item text]];
        }
        else if([item.tagName isEqualToString:@"br"])
            [result appendString:@"\n"];
        else if([item.tagName isEqualToString:@"time"])
            [result appendFormat:@" %@", [item text]];  //especially for reviewsHead
        
    }
    }
    @catch(NSException *e)
    {
        NSLog(@"%d   %@", i, s);
    }
    return result;
}

@end
