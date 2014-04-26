//
//  Comment.h
//  NestedCommentsSample
//
//  Created by Admin on 4/19/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) NSInteger depth;

+ (id)dataObjectWithAuthor:(NSString *)author_ andTime:(NSString *)time_ andText:(NSString *)text_ andDepth:(NSInteger)depth_;

- (id)initWithAuthor:(NSString *)author_ andTime:(NSString *)time_ andText:(NSString *)text_ andDepth:(NSInteger)depth_;

@end
