//
//  CompaniesParser.h
//  HTMLParsing
//
//  Created by Admin on 5/5/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "TextConverter.h"
#import "Company.h"
#import "CompanyDetail.h"
#import "CommentsParser.h"
#import "ReviewsParser.h"

@interface CompaniesParser : NSObject

- (NSMutableArray *)getCompanies:(NSData *)data;
//- (CompanyDetail *)getDetailInfoOf:(NSString *)companyName;
//- (CompanyDetail *)getDetailInfoOf:(NSString *)companyName andData:(NSData *)data;
//- (CompanyDetail *)getDetailInfoWithData:(NSData *)data;
- (CompanyDetail *)getDetailInfoWithData:(NSData *)data andCompanyName:(NSString *)companyName;

@end
