//
//  Review.h
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Review : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *comment;

@property(nonatomic, strong) NSString * jobExperience;
@property(nonatomic, strong)NSString * rating;      

@property (assign, nonatomic) NSInteger level;
@property (assign, nonatomic) Color color;

@property (assign, nonatomic) NSInteger commentsCount;

@end
