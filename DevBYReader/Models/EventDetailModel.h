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
@property (assign, nonatomic) NSInteger listenersCount;
@property (assign, nonatomic) NSInteger commentsCount;

@property (strong, nonatomic) NSString *sponsorName;
@property (strong, nonatomic) NSString *sponsorLogoAddress;
@property (strong, nonatomic) NSString *sponsorInfo;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *siteAddress;
@property (strong, nonatomic) NSString *phoneNumber;

@property (strong, nonatomic) NSString *description;

@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *address;

@end
