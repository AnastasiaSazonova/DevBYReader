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
    NSMutableArray *btnLinks;
}

- (NSMutableArray *)getCommentsWithArray:(NSArray *)commentsNodes;
- (void)depthLimitting;

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
    /*NSData *commentsHtmlData = [NSData dataWithContentsOfURL:url];
    TFHpple *commentsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:commentsHtmlData]];
    nodes = [commentsParser searchWithXPathQuery:address];*/
    
    ////////////////
    /*NSString *jsAddress = [[[element firstChildWithClassName:@"comment-show-replies"]firstChildWithTagName:@"a"] objectForKey:@"href"];
    NSString *htmlString = [self getCommentsHtmlStringFromJS:jsAddress];
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    TFHpple *commentsParser = [TFHpple hppleWithHTMLData:data];
    NSArray *nodesJS = [commentsParser searchWithXPathQuery:@"div[@class='clearfix comment']"];
    
    NSMutableArray *objectsJS = [[NSMutableArray alloc] init];
    objectsJS = [self getCommentsWithArray:nodesJS];*/
    
    //NSURL *urlRes = [NSURL URLWithString:url];
    //NSString *strRes = [NSString stringWithContentsOfURL:url];
    
    NSData *commentsHtmlData = [NSData dataWithContentsOfURL:url];
    btnLinks = [self getBtnLinks:commentsHtmlData]; //!
    
    //TFHpple *commentsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:commentsHtmlData]];
    //NSArray *btns = [commentsParser searchWithXPathQuery:@"//div[@class='comment-show-replies']/a"];
    
    NSString *result = [self changeButtons:url];
    NSData *dataResult = [result dataUsingEncoding:NSUTF8StringEncoding];
    ////////////////
    TFHpple *er = [TFHpple hppleWithHTMLData:dataResult];
    nodes = [er searchWithXPathQuery:address];
    ////
    
    objects = [self getCommentsWithArray:nodes];
    [self depthLimitting];
    
    return objects;
}
- (NSString *)changeButtons:(NSURL *)url
{
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *htmlResult = [[NSString alloc] initWithString:html];
    
    for(int i = 0; i < btnLinks.count; i++)
    {
        NSRange startRange = [htmlResult rangeOfString:@"<div class='comment-show-replies'>"];

        NSString *htmlStart = [htmlResult substringToIndex:startRange.location];
        NSString *htmlEnd = [htmlResult substringFromIndex:(startRange.location + startRange.length)];
        htmlResult = [NSString stringWithFormat:@"%@%@<div>%@", htmlStart, [self getHtmlStringFromJS:(NSString *)btnLinks[i]], htmlEnd];
    }
    
    return htmlResult;
    //NSRange endRange = [html rangeOfString:@"<div class='loading'></div></div>"];
    
    
    //
    /*NSRange r = [html rangeOfString:@"root.append("];
    NSString *x = [html substringFromIndex:r.location + r.length + 1];
    
    NSRange t = [x rangeOfString:@"root.find("];
    NSString *y = [x substringToIndex:t.location];
    
    NSRange i = [y rangeOfString:@");" options:NSBackwardsSearch];
    NSString *getString = [y substringToIndex:i.location - 1];*/
}
- (NSMutableArray *)getBtnLinks:(NSData *)data
{
    TFHpple *commentsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:data]];
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
    //////
    //UIWebView *view = [[UIWebView alloc] init];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://companies.dev.by%@", link]]];
    NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSRange r = [html rangeOfString:@"root.append("];
    NSString *x = [html substringFromIndex:r.location + r.length + 1];
    
    NSRange t = [x rangeOfString:@"root.find("];
    NSString *y = [x substringToIndex:t.location];
    
    NSRange i = [y rangeOfString:@");" options:NSBackwardsSearch];
    NSString *getString = [y substringToIndex:i.location - 1];
    
    NSMutableString *newGetString = [getString mutableCopy];
    getString = [newGetString stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    
    NSMutableString *newGetString1 = [getString mutableCopy];
    getString = [newGetString1 stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    //[view loadHTMLString:getString baseURL:nil];
    //[self.view addSubview:view];
    
    //////
    return getString;
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
        ///////jsREPLY
        /*else if([element firstChildWithClassName:@"comment-show-replies"])
        {
            NSString *jsAddress = [[[element firstChildWithClassName:@"comment-show-replies"]firstChildWithTagName:@"a"] objectForKey:@"href"];
            NSString *htmlString = [self getCommentsHtmlStringFromJS:jsAddress];
            NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
            
            TFHpple *commentsParser = [TFHpple hppleWithHTMLData:data];
            NSArray *nodesJS = [commentsParser searchWithXPathQuery:@"div[@class='clearfix comment']"];
            
            NSMutableArray *objectsJS = [[NSMutableArray alloc] init];
            objectsJS = [self getCommentsWithArray:nodesJS];
        }*/
        //////
        
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
