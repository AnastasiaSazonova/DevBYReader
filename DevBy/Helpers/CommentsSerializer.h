//
//  CommentsSerializer.h
//  DevBy
//
//  Created by Admin on 6/13/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@interface CommentsSerializer : AFHTTPResponseSerializer

- (id)initWithWithUrl:(NSURL *)url andAddress:(NSString *)address;

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error;

@end
