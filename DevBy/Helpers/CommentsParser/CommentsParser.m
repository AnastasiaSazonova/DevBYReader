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

- (NSString *)getCommentsHtmlStringFromJS
{
    //////
    //UIWebView *view = [[UIWebView alloc] init];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://companies.dev.by/show_replies?id=6091&time=2014-05-07+20%3A21%3A26+%2B0300"]];
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

- (NSMutableArray *)getCommentsWithUrl:(NSURL *)url andAddress:(NSString *)address;
{
    NSData *commentsHtmlData = [NSData dataWithContentsOfURL:url];
    TFHpple *commentsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:commentsHtmlData]];
    nodes = [commentsParser searchWithXPathQuery:address];
    
    objects = [self getCommentsWithArray:nodes];
    [self depthLimitting];
    
    return objects;
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
            comment.color = [UIColor redColor];   //?
        }
        NSString *username = [[[[commentWrap firstChildWithClassName:@"comment-content"] firstChildWithClassName:@"comment-info"] firstChildWithTagName:@"a"] text];
        comment.username = username;      //?
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
