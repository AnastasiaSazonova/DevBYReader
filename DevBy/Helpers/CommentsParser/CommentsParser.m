//
//  CommentsParser.m
//  HTMLParsing
//
//  Created by Admin on 5/4/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "CommentsParser.h"

NSInteger const DepthLimitation = 6;

@interface CommentsParser()
{
    NSMutableArray *objects;
    NSInteger currentLevel;
    TextConverter *textConverter;
        
    NSArray *nodes;
    NSMutableArray *buttonLinks;
}

- (NSMutableArray *)getCommentsWithArray:(NSArray *)commentsNodes;
- (void)depthLimitting;

- (NSMutableArray *)getButtonLinks:(NSData *)data;
- (NSString *)getHtmlWithJSContent:(NSData *)data;
- (NSString *)getHtmlStringFromJS:(NSString *)link;

@end

@implementation CommentsParser

- (id)init;
{
    self = [super init];
    if(self)
    {
        objects = [[NSMutableArray alloc] init];
        currentLevel = -1;
        textConverter = [[TextConverter alloc] init];
    }
    return self;
}

- (NSMutableArray *)getCommentsWithUrl:(NSURL *)url andAddress:(NSString *)address;
{
    NSData *commentsHtmlData = [NSData dataWithContentsOfURL:url];
    buttonLinks = [self getButtonLinks:commentsHtmlData];
    
    NSString *updatedString = [self getHtmlWithJSContent:commentsHtmlData];
    NSData *updatedData = [updatedString dataUsingEncoding:NSUTF8StringEncoding];
    
    TFHpple *parser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:updatedData]];
    nodes = [parser searchWithXPathQuery:address];

    objects = [self getCommentsWithArray:nodes];
    [self depthLimitting];
    
    return objects;
}

- (NSString *)getHtmlWithJSContent:(NSData *)data
{
    NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    for(int i = 0; i < buttonLinks.count; i++)
    {
        NSRange startRange = [html rangeOfString:@"<div class='comment-show-replies'>"];

        NSString *htmlStart = [html substringToIndex:startRange.location];
        NSString *htmlEnd = [html substringFromIndex:(startRange.location + startRange.length)];
        html = [NSString stringWithFormat:@"%@%@<div>%@", htmlStart, [self getHtmlStringFromJS:(NSString *)buttonLinks[i]], htmlEnd];
    }
    
    return html;
}

- (NSMutableArray *)getButtonLinks:(NSData *)data
{
    TFHpple *commentsParser = [TFHpple hppleWithHTMLData:data];
    NSArray *btns = [commentsParser searchWithXPathQuery:@"//div[@class='comment-show-replies']/a"];
    
    NSMutableArray *links = [[NSMutableArray alloc] init];
    for(TFHppleElement *item in btns)
    {
        [links addObject:[item objectForKey:@"href"]];
    }
    return links;
}

- (NSString *)getHtmlStringFromJS:(NSString *)link
{
    NSData *jsData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://companies.dev.by%@", link]]];
    NSString *jsHtml = [[NSString alloc] initWithData:jsData encoding:NSUTF8StringEncoding];
    NSRange startCuttingRange = [jsHtml rangeOfString:@"root.append("];
    NSString *startCuttingHtml = [jsHtml substringFromIndex:startCuttingRange.location + startCuttingRange.length + 1];
    
    NSRange nextCuttingRange = [startCuttingHtml rangeOfString:@"root.find("];
    NSString *nextCuttingHtml = [startCuttingHtml substringToIndex:nextCuttingRange.location];
    
    NSRange resultRange = [nextCuttingHtml rangeOfString:@");" options:NSBackwardsSearch];
    NSString *resultHtml = [nextCuttingHtml substringToIndex:resultRange.location - 1];
    
    resultHtml = [resultHtml stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    resultHtml = [resultHtml stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    return resultHtml;
}

- (NSMutableArray *)getCommentsWithArray:(NSArray *)commentsNodes
{
    for(TFHppleElement *element in commentsNodes)
    {
        currentLevel++;
        Comment *comment = [[Comment alloc] init];
        [objects addObject:comment];
        
        TFHppleElement *commentWrap = [element firstChildWithClassName:@"comment-wrap"];
        if(commentWrap == nil)
        {
            commentWrap = [element firstChildWithClassName:@"comment-wrap negative"];
            comment.color = [UIColor redColor];
        }
        NSString *username = [[[[commentWrap firstChildWithClassName:@"comment-content"] firstChildWithClassName:@"comment-info"] firstChildWithTagName:@"a"] text];
        comment.username = username;
        NSString *date = [[[[[commentWrap firstChildWithClassName:@"comment-content"] firstChildWithClassName:@"comment-info"] firstChildWithTagName:@"time"] firstChildWithTagName:@"a"] text];
        comment.date = date;
        
        TFHppleElement *commentText = [[commentWrap firstChildWithClassName:@"comment-content"] firstChildWithClassName:@"comment-text"];
        if(commentText == nil)
            commentText = [[commentWrap firstChildWithClassName:@"comment-content"] firstChildWithClassName:@"comment-text negative"];
        
        NSArray *htmlElements = [commentText children];
        NSString *comments = [textConverter getText:htmlElements];
        comment.comment = comments;
        
        comment.level = currentLevel;
        
        NSArray *currentChildrenArray = [element childrenWithClassName:@"clearfix comment"];
        if(currentChildrenArray.count == 0)
            currentChildrenArray = [element childrenWithClassName:@"clearfix comment noindent"];
        
        if(currentChildrenArray.count != 0)
            [self getCommentsWithArray:currentChildrenArray];
        
        currentLevel--;        
    }
    return objects;
}

- (void)depthLimitting
{
    for(Comment *comment in objects)
    {
        if(comment.level > DepthLimitation)
            comment.level = DepthLimitation;
    }
}

@end
