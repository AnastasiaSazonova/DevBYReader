//
//  CompaniesListSerializer.h
//  DevBy
//
//  Created by Admin on 6/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@interface CompaniesListSerializer : AFHTTPResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error;

@end
