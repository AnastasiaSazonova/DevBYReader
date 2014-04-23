//
//  EventModel.h
//  DevBYReader
//
//  Created by Admin on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject

@property (assign, nonatomic) NSInteger eventId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *dateDet;
@property (strong, nonatomic) NSString *description;

- (id)initWithId:(NSInteger)eventId_ andTitle:(NSString *)title_ andDate:(NSString *)date_ andDateDet:(NSString *)dateDet_ andDescription:(NSString *)description_;

@end
