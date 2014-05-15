//
//  PostsParser.h
//  DevBy
//
//  Created by Admin on 5/15/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostDetail.h"
#import "Post.h"
#import "TFHpple.h"

@interface PostsParser : NSObject

- (NSMutableArray *)getPosts;
//- (PostDetail *)getDetailPostOf:(NSString *)postName;

@end
