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
        operationQueue = [[NSOperationQueue alloc]init];
    }
    return self;
}

- (void)startParseFromUrl:(NSString*)url andXPath:(NSString*) xpath
{
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
         
        TFHpple * parser = [TFHpple hppleWithHTMLData:data];
         
        NSArray * jobsNodes = [parser searchWithXPathQuery:xpath];
        NSMutableDictionary* htmlDIctionary = [NSMutableDictionary dictionary];
             
        for(TFHppleElement *element in [[jobsNodes firstObject] children])
        {
            [self cycle:element dictionary:htmlDIctionary];
        }

        [[NSOperationQueue mainQueue] addOperationWithBlock:^
        {
             [self.delegate parseData:htmlDIctionary WithUrl:url andXPath:xpath];
        }];
     }];
}

- (void) finishParse
{
    [operationQueue cancelAllOperations];
}

- (void) cycle:(TFHppleElement*) element dictionary:(NSMutableDictionary*)dictionary
{
    if(![element hasChildren] && [element content])
    {
        [self setDictionary: dictionary object: [element content]  ForKey: element.tagName];
        return;
    }
    
    NSMutableDictionary* elementDictionary = [NSMutableDictionary dictionary];
    for(TFHppleElement *children in [element children])
    {
        [self setDictionary: dictionary object: elementDictionary ForKey:element.tagName];
        
        if([children hasChildren])
            [self cycle:children dictionary: elementDictionary];
        
        if(![children hasChildren] && [children content])
        {
            [self setDictionary:elementDictionary object:[children content] ForKey:children.tagName];
        }
    }
}

- (void) setDictionary:(NSMutableDictionary*)dictionary object:(id) object ForKey:(NSString*) key
{
    if ([dictionary objectForKey:key])
    {
        [dictionary setObject:object forKey:key];
    } else
    {
        [dictionary setObject: object forKey:[NSString stringWithFormat:@"%@_%d",key, [dictionary.allKeys count] + 1]];
    }
}

@end