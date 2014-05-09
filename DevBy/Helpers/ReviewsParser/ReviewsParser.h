//
//  ReviewsParser.h
//  HTMLParsing
//
//  Created by Admin on 5/6/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Review.h"
#import "TextConverter.h"

@interface ReviewsParser : NSObject

- (NSMutableArray *)getReviewsWithUrl:(NSURL *)url andAddress:(NSString *)address;

@end
