//
//  EventDetailModel.h
//  DevBYReader
//
//  Created by Admin on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDetailModel : NSObject

@property (assign, nonatomic) NSInteger eventId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *description;

@end
