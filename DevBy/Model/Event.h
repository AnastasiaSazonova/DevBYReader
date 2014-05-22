//
//  Event.h
//  HTMLParsing
//
//  Created by Admin on 5/5/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSString *month;
@property (strong, nonatomic) NSString *dayOfWeek;
@property (strong, nonatomic) NSString *description;    
@property (strong, nonatomic) NSString *link;

@end
