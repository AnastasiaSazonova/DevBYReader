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

@interface HTMLParser()
{
    NSString *str;
    int count;
    NSMutableArray* xpathArray;
}
@property(nonatomic, strong)TFHpple * parser;
@property (nonatomic, strong) NSString *url;

@end

@implementation HTMLParser

+ (HTMLParser *)sharedInstance
{
    static HTMLParser *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMLParser alloc] init];
    });
    return sharedInstance;
}

-(NSString *)url
{
    if (!_url)
    {
        _url = @"http://dev.by/blogs/main/analitika-na-github"; //@"http://dev.by";
        //@"http://jobs.dev.by";//@"http://dev.by/?page=2";//@"http://dev.by/blogs/toptal/init-js-zachem-i-kak-razrabatyvat-s-full-stack-javascript";
        //        @"http://dev.by";
    }
    return _url;
}

- (void)startParseCategory:(NSString*)identifier andPostfixOfUrl:(NSString*) postfix
{
    if([identifier isEqualToString: NEWS])
    {
        str = [NSString string];
        self.url = @"http://dev.by";
        if(!postfix)
            xpathArray = [NSMutableArray arrayWithObject:@"//div[@class='lists-blogs']"];
        else
        {
            _url =  [NSString stringWithFormat:@"%@%@", _url,postfix];
            xpathArray = [NSMutableArray arrayWithObjects:@"//div[@class='blog-views-node item-body']", @"//div[@class='comments-list list-more']", nil];
        }
        [self performSelectorInBackground:@selector(startParse) withObject:nil];
    }
}

- (void) startParse
{
    NSURL *tutorialsUrl = [NSURL URLWithString:self.url];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    self.parser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
    for(NSString* xpath in xpathArray)
    {
        NSArray * jobsNodes = [self.parser searchWithXPathQuery:xpath];
        
        for(TFHppleElement *element in [[jobsNodes firstObject] children])
        {
            [self cycle:element];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@",str);
    });
}

- (void) cycle:(TFHppleElement*) element
{
    if(![element hasChildren]){
        str = [NSString stringWithFormat:@"%@%@", str, [element content]];
        return;
        //        NSLog(@"%@  backSpace    %d",[element content], [[element content] length] );
        //        NSString* string = [[element content] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        //        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        //        string = [NSString stringWithFormat:@"\n%@",string];
        //        NSLog(@"  %@ AfterbackSpace %d",string, [[element content] length]);
    }
    
    for(TFHppleElement *children in [element children])
    {
        if([[[[children parent] parent]parent].tagName isEqualToString:@"ol"] && [[children parent].tagName isEqualToString:@"p"])
        {
            str = [NSString stringWithFormat:@"%@ %d. %@", str,count, [children content]];
            count += 1;
            continue;
        }
        if([[[[children parent] parent]parent].tagName isEqualToString:@"ul"] && [[children parent].tagName isEqualToString:@"pre"])
        {
            str = [NSString stringWithFormat:@"%@ %d. %@", str,1, [children content]];
            continue;
        }
        if(![children hasChildren] && [children.tagName isEqualToString:@"text"])
        {
            str = [NSString stringWithFormat:@"%@ %@", str, [children content]];
        }
        if (![children hasChildren] && [children.tagName isEqualToString:@"img"])
        {
            //            NSLog(@"%@  IMAGE ",[children objectForKey:@"src"]);
        }
        if([children hasChildren])
            [self cycle:children];
    }
}

@end