//
//  CommentsSerializer.m
//  DevBy
//
//  Created by Admin on 6/13/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsSerializer.h"
#import "CommentsParser.h"

@interface CommentsSerializer()
{
    NSURL *commentsURL;
    NSString *commentsAddress;
}
@end

@implementation CommentsSerializer

- (id)initWithWithUrl:(NSURL *)url andAddress:(NSString *)address
{
    self = [super init];
    if(self)
    {
        commentsURL = url;
        commentsAddress = address;
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    NSData *responseData = [super responseObjectForResponse:response data:data error:error];
    
    CommentsParser *commentsParser = [[CommentsParser alloc] init];
    NSArray *comments = [commentsParser getCommentsWithData:data andAddress:commentsAddress];
    
    return comments;
}

@end
