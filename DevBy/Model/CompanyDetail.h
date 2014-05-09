//
//  CompanyDetail.h
//  HTMLParsing
//
//  Created by Admin on 5/5/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"

@interface CompanyDetail : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *workersCount;
@property (strong, nonatomic) NSString *fullName;
@property (strong, nonatomic) NSString *about;
@property (strong, nonatomic) NSArray *comments;
@property (strong, nonatomic) NSArray *reviews;

@end
