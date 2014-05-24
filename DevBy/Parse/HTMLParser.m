//
//  HTMLParser.m
//  DevBy
//
//  Created by Anastasia on 5/17/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "HTMLParser.h"
#import "Constants.h"
#import "TFHpple.h"

@implementation HTMLParser
{
    NSOperationQueue* operationQueue;
    NSString* currentUrl;
    NSData* currentData;
}

+ (HTMLParser *)sharedInstance
{
    static HTMLParser *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMLParser alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        currentUrl = [NSString string];
        currentData = [NSData data];
        operationQueue = [[NSOperationQueue alloc]init];
    }
    return self;
}

- (void)startParseFromUrl:(NSString*)url andXPath:(NSString*) xpath
{
    if([currentUrl isEqualToString:url])
    {
        [operationQueue addOperationWithBlock:^{
             [self parsingData:currentData withXPath:xpath];
        }];
        return;
    }
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString: url] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0f];
    [NSURLConnection sendAsynchronousRequest:request queue:operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if(error || [data length] ==0)
        {
             [[NSOperationQueue mainQueue] addOperationWithBlock:^
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error.description message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }];
            return;
        }
        currentUrl = url;
        currentData = data;
        
        [self parsingData:data withXPath:xpath];
     }];
}

- (void)parsingData:(NSData*)data withXPath:(NSString*)xpath
{
    NSMutableDictionary* htmlDIctionary = [NSMutableDictionary dictionary];
    NSArray * jobsNodes = [[TFHpple hppleWithHTMLData:data] searchWithXPathQuery:xpath];
    
    for(TFHppleElement *element in [[jobsNodes firstObject] children])
    {
        if([element.attributes count] > 0)
        {
            NSMutableArray* array = [NSMutableArray array];
            [self cycle:element array:array key:[NSString string]];
            [htmlDIctionary setObject:array forKey:[NSNumber numberWithInt:[htmlDIctionary.allValues count] + 1]];
        }
    }
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^
     {
         [self.delegate parseData:htmlDIctionary WithUrl:currentUrl andXPath:xpath];
     }];
}

- (void) finishParse
{
    [operationQueue cancelAllOperations];
}


- (void) cycle:(TFHppleElement*) element array:(NSMutableArray*)array key:(NSString*) keyForDictionary
{
    if(![element hasChildren] && [element content])
    {
        return;
    }
    
    for(TFHppleElement *children in [element children])
    {
        if(![children hasChildren] && [children content] && [[children content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)
        {
            continue;
        }
        if([children.tagName isEqualToString:@"a"] && [[children.attributes  objectForKey:@"class"] isEqualToString:@"blog-node-title"])
        {
            [array addObject:[NSDictionary dictionaryWithObject:[children.attributes  objectForKey:@"href"]forKey:[NSString stringWithFormat:@"%@%@/title_url_link",keyForDictionary,children.tagName]]];
            [array addObject:[NSDictionary dictionaryWithObject:[[children firstChild] content]forKey:[NSString stringWithFormat:@"%@%@/title_link",keyForDictionary,children.tagName]]];
            continue;
        }
        if([children.tagName isEqualToString:@"a"] && [[children.attributes  objectForKey:@"target"] isEqualToString:@"_blank"])
        {
            [array addObject:[NSDictionary dictionaryWithObject:[children.attributes  objectForKey:@"href"]forKey:[NSString stringWithFormat:@"%@%@/blank_url",keyForDictionary,children.tagName]]];
            [array addObject:[NSDictionary dictionaryWithObject:[[children firstChild] content]forKey:[NSString stringWithFormat:@"%@%@/blank_description",keyForDictionary,children.tagName]]];
            continue;
        }
        if([children.tagName isEqualToString:@"a"] && [children.attributes.allKeys count] == 1 && [children.attributes  objectForKey:@"href"])
        {
            [array addObject:[NSDictionary dictionaryWithObject:[children.attributes  objectForKey:@"href"]forKey:[NSString stringWithFormat:@"%@%@/link_sentence_url",keyForDictionary,children.tagName]]];
            if ([[children firstChild] content])
            {
                [array addObject:[NSDictionary dictionaryWithObject:[[children firstChild] content]forKey:[NSString stringWithFormat:@"%@%@/link_sentence",keyForDictionary,children.tagName]]];
            }
            
            continue;
        }
        if(![children hasChildren] && [children.tagName isEqualToString:@"img"])
        {
            [array addObject:[NSDictionary dictionaryWithObject:[children objectForKey:@"src"] forKey:[NSString stringWithFormat:@"%@%@",keyForDictionary,children.tagName]]];
            continue;
        }
        if(![children hasChildren] && [children content] && [children.tagName isEqualToString:@"text"])
        {
            [array addObject:[NSDictionary dictionaryWithObject:[children content] forKey:[NSString stringWithFormat:@"%@%@",keyForDictionary,children.tagName]]];
            continue;
        }
        if([children hasChildren] && ![children.tagName isEqualToString:@"a"] && [children.tagName isEqualToString:@"div"])
        {
            [self cycle:children array:array key: keyForDictionary];
            continue;
        }
        if([children hasChildren] && ![children.tagName isEqualToString:@"a"] && ![children.tagName isEqualToString:@"div"] && [keyForDictionary isEqualToString:@""])
        {
            [self cycle:children array:array key: [NSString stringWithFormat:@"%@%@/",keyForDictionary,children.tagName]];
            continue;
        }
        if([children hasChildren] && ![children.tagName isEqualToString:@"a"] && ![children.tagName isEqualToString:@"div"] && ![keyForDictionary isEqualToString:@""])
        {
           [self cycle:children array:array key: [NSString stringWithFormat:@"%@/%@/",keyForDictionary,children.tagName]];
            continue;
        }
    }
}

@end
