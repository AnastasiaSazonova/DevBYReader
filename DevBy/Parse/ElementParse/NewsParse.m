//
//  NewsParse.m
//  DevBy
//
//  Created by Admin on 22.05.14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "NewsParse.h"
#import "NewsElement.h"

@implementation NewsParse

- (NSArray*) getDataFromDictionary:(NSDictionary*) dictionary
{
    NSArray * allkeys = [dictionary allKeys];
    allkeys = [allkeys sortedArrayUsingComparator: ^(id obj1, id obj2)
               {
                   if ([obj1 integerValue] > [obj2 integerValue])
                       return (NSComparisonResult)NSOrderedDescending;
                   
                   if ([obj1 integerValue] < [obj2 integerValue])
                       return (NSComparisonResult)NSOrderedAscending;
                   
                   return (NSComparisonResult)NSOrderedSame;
               }];

     NSMutableArray* arrayWithElements = [NSMutableArray array];
    
    [allkeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        if(![[dictionary objectForKey:obj] isKindOfClass:NSArray.class] || [[dictionary objectForKey:obj] count] < 3)
            return ;
        
       [arrayWithElements addObject:[self parseDictionary:[dictionary objectForKey:obj]]];
    }];
    return arrayWithElements;
}

-(NewsElement*)parseDictionary:(NSArray *)array
{
    NewsElement* element = [[NewsElement alloc]init];
    
    for(NSDictionary* dictionary in array)
    {
//        NSLog(@"%@",dictionary);
        if([dictionary.allKeys count] > 1)
            continue;
        if(![[dictionary.allKeys firstObject] isKindOfClass:NSString.class])
            continue;

        if([[dictionary.allKeys firstObject] rangeOfString:@"title_url_link"].location != NSNotFound)
        {
            element.url = [dictionary.allValues firstObject];
            continue;
        }
        if([[dictionary.allKeys firstObject] rangeOfString:@"title_link"].location != NSNotFound)
        {
            element.title = [dictionary.allValues firstObject];
            continue;
        }
        if([[dictionary.allKeys firstObject] rangeOfString:@"time/text"].location != NSNotFound)
        {
            element.time = [dictionary.allValues firstObject];
            continue;
        }
        if([[dictionary.allKeys firstObject] rangeOfString:@"img"].location != NSNotFound)
        {
            element.image = [dictionary.allValues firstObject];
            continue;
        }
        if([[dictionary.allKeys firstObject] rangeOfString:@"p/text"].location != NSNotFound)
        {
            element.content = [NSString stringWithFormat:@"%@ \n %@", element.content, [dictionary.allValues firstObject]];
            continue;
        }
        if([[dictionary.allKeys firstObject] rangeOfString:@"text"].location != NSNotFound)
        {
            element.rate = [dictionary.allValues firstObject];
            continue;
        }
    }
    return element;
//    [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop)
//    {
//        NSLog(@"%@",obj);
//        
//       if(![obj isKindOfClass:NSDictionary.class])
//           return;
//        
//        NSDictionary* dictionary = (NSDictionary*)obj;
//        
//        if([dictionary.allKeys count] > 1)
//            return;
//        if([[dictionary.allKeys firstObject] isKindOfClass:NSString.class])
//            return;
//
//        if([[dictionary.allKeys firstObject] rangeOfString:@"title_link_url"].location != NSNotFound)
//        {
//            element.url = [dictionary.allValues firstObject];
//        }
//        if([[dictionary.allKeys firstObject] rangeOfString:@"text"].location != NSNotFound)
//        {
//            element.rate = [dictionary.allValues firstObject];
//        }
//        if([[dictionary.allKeys firstObject] rangeOfString:@"title_link"].location != NSNotFound)
//        {
//            element.title = [dictionary.allValues firstObject];
//        }
//        if([[dictionary.allKeys firstObject] rangeOfString:@"time/text"].location != NSNotFound)
//        {
//            element.time = [dictionary.allValues firstObject];
//        }
//        if([[dictionary.allKeys firstObject] rangeOfString:@"img"].location != NSNotFound)
//        {
//            element.image = [dictionary.allValues firstObject];
//        }
//        if([[dictionary.allKeys firstObject] rangeOfString:@"p/text"].location != NSNotFound)
//        {
//            element.content = [NSString stringWithFormat:@"%@ \n %@", element.content, [dictionary.allValues firstObject]];
//        }
//    }];
  
}
@end
