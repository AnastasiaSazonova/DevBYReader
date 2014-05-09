//
//  EventsParser.h
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextConverter.h"
#import "Event.h"
#import "EventDetail.h"

@interface EventsParser : NSObject

- (NSMutableArray *)getEvents;
- (EventDetail *)getDetailInfoOf:(NSString *)eventName;

@end
