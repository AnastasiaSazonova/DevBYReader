//
//  CompanyDetailSerializer.m
//  DevBy
//
//  Created by Admin on 6/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CompanyDetailSerializer.h"
#import "CompaniesParser.h"
#import "Constants.h"

@interface CompanyDetailSerializer()
{
    NSString *company;
}
@end

@implementation CompanyDetailSerializer

- (id)initWithCompanyName:(NSString *)companyName
{
    self = [super init];
    if(self)
    {
        company = companyName;  //?
    }
    
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    NSData *responseData = [super responseObjectForResponse:response data:data error:error];
    
    //NSURL *companiesUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", PrefixCompanyUrl, companyName]];
    //NSData *companiesHtmlData = [NSData dataWithContentsOfURL:companiesUrl];
    
    CompaniesParser *companiesParser = [[CompaniesParser alloc] init];
    //NSArray *companysNames = [companiesParser getDetailInfoOf:(NSString *)getCompanies:responseData];
    CompanyDetail *companyDetail = [companiesParser getDetailInfoWithData:responseData andCompanyName:company];
    
    return companyDetail;
}

@end
