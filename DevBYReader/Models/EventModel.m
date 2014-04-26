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
        eventId = eventId_;
        title = title_;
        date = date_;
        dateDet = dateDet_;
        description = description_;
    }
    return self;
}

@end
