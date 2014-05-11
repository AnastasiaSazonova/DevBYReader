//
//  Review.h
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *comment;

@property (assign, nonatomic) NSInteger level;
@property (strong, nonatomic) UIColor *color;

@end
