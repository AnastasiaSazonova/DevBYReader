//
//  EventRepository.h
//  DevBYReader
//
//  Created by Admin on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventDetailModel.h"
#import "EventModel.h"

@interface EventRepository : NSObject

- (NSArray *)getEventsList;
- (EventDetailModel *)getEventDetailModel:(NSInteger)eventId_;

@end
