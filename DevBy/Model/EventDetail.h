//
//  EventDetail.h
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDetail : NSObject

@property (strong, nonatomic) NSString *title;  
@property (strong, nonatomic) NSString *time;  
@property (assign, nonatomic) NSInteger listenersCount; 

@property (strong, nonatomic) NSString *sponsorInfo;    
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *siteAddress;
@property (strong, nonatomic) NSString *phoneNumber;    

@property (strong, nonatomic) NSString *description;    

@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *address;

@end
