//
//  EventsParser.m
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "EventsParser.h"

NSString *const PrefixEventUrl = @"http://events.dev.by/";

@interface EventsParser()
{
    TextConverter *textConverter;
}
@end

@implementation EventsParser

- (id)init
{
    self = [super init];
    if(self)
    {
        textConverter = [[TextConverter alloc] init];
    }
    return self;
}

- (NSMutableArray *)getEvents
{
    NSURL *eventsUrl = [NSURL URLWithString:PrefixEventUrl];
    NSData *eventsHtmlData = [NSData dataWithContentsOfURL:eventsUrl];    
    TFHpple *eventsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:eventsHtmlData]];
    
    NSString *eventsXpathQueryString = @"//div[@class='list-item-events list-more']/div[@class='item']";
    NSArray *nodes = [eventsParser searchWithXPathQuery:eventsXpathQueryString];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(TFHppleElement *element in nodes)
    {
        Event *event = [[Event alloc] init];
        [result addObject:event];
        
        NSString *title = [[[element firstChildWithClassName:@"item-body left"] firstChildWithTagName:@"a"] text];
        event.title = title;
        
        NSString *day = [[[element firstChildWithClassName:@"item-date left"] firstChildWithTagName:@"h4"] text];
        event.day = day;
        
        NSString *dateDetMonth = [[[[element firstChildWithClassName:@"item-date left"] firstChildWithTagName:@"strong"] firstChildWithTagName:@"time"] text];
        event.month = dateDetMonth;
        NSString *dateDetDay = [[[[element firstChildWithClassName:@"item-date left"] firstChildWithTagName:@"span"] firstChildWithTagName:@"time"] text];
        event.dayOfWeek = dateDetDay;
        
        NSString *description = [textConverter getText:[[element firstChildWithClassName:@"item-body left"] firstChildWithTagName:@"p"].children];
        event.description = description;        
    }    
    return result;
}

- (EventDetail *)getDetailInfoOf:(NSString *)eventName
{
    EventDetail *result = [[EventDetail alloc] init];
    
    NSURL *eventsUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", PrefixEventUrl, eventName]];
    NSData *eventsHtmlData = [NSData dataWithContentsOfURL:eventsUrl];
    TFHpple *eventsParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:eventsHtmlData]];
    NSString *eventsXpathQueryString = @"//div[@class='dev-center nopd']/div[@class='show-events']";
    TFHppleElement *node = [eventsParser peekAtSearchWithXPathQuery:eventsXpathQueryString];
    
    NSString *title = [[[[node firstChildWithClassName:@"block data-topic-events"] firstChildWithClassName:@"left item-body body-events"] firstChildWithTagName:@"h1"] text];
    result.title = title;
    
    NSString *time = [[[[node firstChildWithClassName:@"block data-topic-events"] firstChildWithClassName:@"left item-body body-events"] firstChildWithClassName:@"time"] text];
    result.time = time;
    
    NSString *listenersCount = [[[[[[node firstChildWithClassName:@"block data-topic-events"] firstChildWithClassName:@"right sidebar-show-events"] firstChildWithClassName:@"status-event"] firstChildWithClassName:@"user-events"] firstChildWithTagName:@"strong"] text];
    result.listenersCount = [listenersCount integerValue];
    
    NSString *sponsorInfo = [[[[[[node firstChildWithClassName:@"block data-desc-events clearfix"] firstChildWithClassName:@"right sidebar-show-events"] firstChildWithClassName:@"bl data-company"] firstChildWithClassName:@"input"] firstChildWithTagName:@"p"] text];
    result.sponsorInfo = sponsorInfo;
    
    NSArray *sponsorElements = [[[[node firstChildWithClassName:@"block data-desc-events clearfix"] firstChildWithClassName:@"right sidebar-show-events"] firstChildWithClassName:@"bl data-company"] firstChildWithClassName:@"info"].children;
    NSString *currentInfo = [[NSString alloc] init];
    for(TFHppleElement *item in sponsorElements)
    {
        if([item.tagName isEqualToString:@"strong"] )
        {
            currentInfo = [item text];
        }
        else if([item.tagName isEqualToString:@"a"])
        {
            if([currentInfo isEqualToString:@"Эл. почта:"])
                result.email = [item text];
            else if([currentInfo isEqualToString:@"Сайт:"])
                result.siteAddress = [item text];
            
        }
        else if([item.tagName isEqualToString:@"text"] && [currentInfo isEqualToString:@"Телефон:"])
            result.phoneNumber = [item content];
    }
    
    NSArray *bottomInfo = [[[node firstChildWithClassName:@"block data-desc-events clearfix"] firstChildWithClassName:@"left body-events"] childrenWithClassName:@"bl"];
    for(int i = 1; i < bottomInfo.count; i++)
    {
        NSString *bottomState = [[NSString alloc] init];
        TFHppleElement *item = (TFHppleElement *)bottomInfo[i];
        for(TFHppleElement *child in item.children)
        {
            if([child.tagName isEqualToString:@"h4"])
                bottomState = [child text];
            
            if([child.tagName isEqualToString:@"div"])
            {
                if([bottomState isEqualToString:@"Стоимость участия"])
                    result.price = [child text];
                else if([bottomState isEqualToString:@"Место проведения"])
                    result.address = [child text];
            }
        }
    }
    
    TFHppleElement *descriptionElement = [[[[node firstChildWithClassName:@"block data-desc-events clearfix"] firstChildWithClassName:@"left body-events"] firstChildWithClassName:@"bl"] firstChildWithClassName:@"input blog-node-content"];
    result.description = [textConverter getText:descriptionElement.children];
    
    return result;
}




@end
