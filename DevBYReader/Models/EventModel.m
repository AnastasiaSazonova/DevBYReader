//
//  EventModel.m
//  DevBYReader
//
//  Created by Admin on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventModel.h"

@implementation EventModel

@synthesize eventId;
@synthesize title;
@synthesize date;
@synthesize dateDet;
@synthesize description;

- (id)initWithId:(NSInteger)eventId_ andTitle:(NSString *)title_ andDate:(NSString *)date_ andDateDet:(NSString *)dateDet_ andDescription:(NSString *)description_
{
    self = [super init];
    if(self)
    {
        self.eventId = eventId_;
        self.title = title_;
        self.date = date_;
        self.dateDet = dateDet_;
        self.description = description_;
    }
    return self;
}

@end
