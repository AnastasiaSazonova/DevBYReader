//
//  CompaniesListSerializer.m
//  DevBy
//
//  Created by Admin on 6/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CompaniesListSerializer.h"
#import "CompaniesParser.h"

@implementation CompaniesListSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    NSData *responseData = [super responseObjectForResponse:response data:data error:error];
    
    CompaniesParser *companiesParser = [[CompaniesParser alloc] init];
    NSArray *companysNames = [companiesParser getCompanies:responseData];
    
    return companysNames;
}

@end
