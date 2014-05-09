//
//  CommentsParser.h
//  HTMLParsing
//
//  Created by Admin on 5/4/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "Comment.h"
#import "TextConverter.h"

@interface CommentsParser : NSObject

- (NSMutableArray *)getCommentsWithUrl:(NSURL *)url andAddress:(NSString *)address;

@end
