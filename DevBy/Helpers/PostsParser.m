//
//  PostsParser.m
//  DevBy
//
//  Created by Admin on 5/15/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "PostsParser.h"

@interface PostsParser ()

@property(nonatomic, strong)NSMutableArray * array;
@property(nonatomic, strong)TFHpple * parser;

@end

@implementation PostsParser

- (NSMutableArray *)getPosts
{
    return self.array;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        self.array = [[NSMutableArray alloc] init];
        [self fillArticlesArray];
    }
    return self;
}

-(void)fillArticlesArray
{
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://dev.by/"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    self.parser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    self.array = [[NSMutableArray alloc] init];
    NSString *articlesXpathQueryString = @"//div[@class='lists-blogs']/div[@class='blog-views-node item-body']";
    [self parseForArticlesByXPath:articlesXpathQueryString];
}

-(void)parseForArticlesByXPath:(NSString *)XPath
{
    NSString * articlesXpathQueryString = XPath;
    
    NSArray * articlesNodes = [self.parser searchWithXPathQuery:articlesXpathQueryString];
    
    for (TFHppleElement *element in articlesNodes)
    {
        [self addArticleFromElement:element];
    }
}

-(void)addArticleFromElement:(TFHppleElement *)element
{
    Post * currentArticle = [[Post alloc] init];
    NSString * title = [[[[element firstChildWithClassName:@"blog-node-top"] firstChildWithTagName:@"h2"] firstChildWithTagName:@"a"] text];
    currentArticle.title = title;
    
    NSString * url = [[[[element firstChildWithClassName:@"blog-node-top"] firstChildWithTagName:@"h2"] firstChildWithTagName:@"a"] objectForKey:@"href"];
    currentArticle.url = url;
    
    /*NSString * rate = [[[[element firstChildWithClassName:@"blog-node-info clearfix"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"bl data-rate plus rate-topic"] text];
    if (!rate)
    {
        rate = @"0";
    }
    currentArticle.rate = rate;
    
    NSString * numberOfComments = [[[[[element firstChildWithClassName:@"blog-node-info clearfix"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"bl data-comment"] firstChildWithTagName:@"a"] text];
    
    currentArticle.numberOfComments = numberOfComments;
    
    NSString * poster = [[[[[element firstChildWithClassName:@"blog-node-info clearfix"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"bl data-poster"] firstChildWithTagName:@"a"] text];
    
    currentArticle.poster = poster;
    
    NSString * postersInfo = [[[[[element firstChildWithClassName:@"blog-node-info clearfix"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"bl data-poster"] firstChildWithTagName:@"span"] text];
    
    if (postersInfo)
    {
        currentArticle.poster = [currentArticle.poster stringByAppendingString:postersInfo];
    }
    NSString * postersCompany = [[[[[[element firstChildWithClassName:@"blog-node-info clearfix"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"bl data-poster"] firstChildWithTagName:@"span"] firstChildWithTagName:@"a"] text];
    if (postersCompany)
    {
        currentArticle.poster = [currentArticle.poster stringByAppendingString:postersCompany];
    }
    */
    NSString * dateTime = [[[[[element firstChildWithClassName:@"blog-node-info clearfix"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"bl data-time"] firstChildWithTagName:@"time"] text];
    
    currentArticle.time = dateTime;
    
    [self.array addObject:currentArticle];
}

@end
