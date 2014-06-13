//
//  CompanyDetailSerializer.h
//  DevBy
//
//  Created by Admin on 6/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@interface CompanyDetailSerializer : AFHTTPResponseSerializer

- (id)initWithCompanyName:(NSString *)companyName;
- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error;

@end
