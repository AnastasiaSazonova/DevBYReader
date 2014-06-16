//
//  CompaniesParser.m
//  HTMLParsing
//
//  Created by Admin on 5/5/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "CompaniesParser.h"
#import "Constants.h"

//NSString *const PrefixCompanyUrl = @"http://companies.dev.by";

@interface CompaniesParser()
{
    TextConverter *textConverter;
}
@end

@implementation CompaniesParser

- (id)init
{
    self = [super init];
    if(self)
    {
        textConverter = [[TextConverter alloc] init];
    }
    return self;
}

- (NSMutableArray *)getCompanies:(NSData *)data
{
    //NSURL *companiesUrl = [NSURL URLWithString:PrefixCompanyUrl];
    //NSData *companiesHtmlData = [NSData dataWithContentsOfURL:companiesUrl];
    //TFHpple *companiesParser = [TFHpple hppleWithHTMLData:companiesHtmlData];
    TFHpple *companiesParser = [TFHpple hppleWithHTMLData:data];
    
    NSString *companiesXpathQueryString = @"//table[@id='tablesort']/tbody/tr";
    NSArray *nodes = [companiesParser searchWithXPathQuery:companiesXpathQueryString];
    NSMutableArray *companyNames = [[NSMutableArray alloc] init];
    for(TFHppleElement *element in nodes)
    {
        Company *company = [[Company alloc] init];
        [companyNames addObject:company];
        
        TFHppleElement *data = [element firstChildWithTagName:@"td"];
        NSString *companyName = [data.attributes objectForKey:@"data"];
        company.name = companyName;
        
        NSString *companyPostfix = [[data firstChildWithTagName:@"a"] objectForKey:@"href"];
        company.postfix = companyPostfix;
    }
    
    return companyNames;
}

//- (CompanyDetail *)getDetailInfoOf:(NSString *)companyName andData:(NSData *)data
- (CompanyDetail *)getDetailInfoWithData:(NSData *)data andCompanyName:(NSString *)companyName
{
    CompanyDetail *result = [[CompanyDetail alloc] init];
    
    //NSURL *companiesUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", PrefixCompanyUrl, companyName]];
    //NSData *companiesHtmlData = [NSData dataWithContentsOfURL:companiesUrl];
    TFHpple *companiesParser = [TFHpple hppleWithHTMLData:[textConverter clearHtmlData:data]];
    NSString *companiesXpathQueryString = @"//div[@class='colums-table']/div[@class='dev-left col1']";
    TFHppleElement *node = [companiesParser peekAtSearchWithXPathQuery:companiesXpathQueryString];
    
    NSString *name = [[[[[node firstChildWithClassName:@"widget-companies-header"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"left"] firstChildWithTagName:@"h2"] text];
    result.name = name;
    NSString *workersCount = [[[[[[node firstChildWithClassName:@"widget-companies-header"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"left"] firstChildWithClassName:@"data-info"] firstChildWithTagName:@"strong"] text];
    result.workersCount = workersCount;
    
    TFHppleElement *fullNameElement = [[[[node firstChildWithClassName:@"widget-companies-header"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"left"] firstChildWithClassName:@"full-name"];
    NSString *formattedFullName = [textConverter getText:fullNameElement.children];
    result.fullName = formattedFullName;

    TFHppleElement *aboutElement;
    aboutElement = [[[[node firstChildWithClassName:@"companies-block"] firstChildWithClassName:@"widget-companies-description"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"left data-desc"];
    if(aboutElement == nil)
        aboutElement = [[[[node firstChildWithClassName:@"companies-block"] firstChildWithClassName:@"widget-companies-description"] firstChildWithClassName:@"clearfix"] firstChildWithClassName:@"all data-desc left"];
    TFHppleElement *aboutElResult = [aboutElement firstChildWithClassName:@"description truncate-description blog-node-content"];
    
    NSString *about = [textConverter getText:aboutElResult.children];
    result.about = about;
    
    ReviewsParser *reviewsParser = [[ReviewsParser alloc] init];
    NSURL *reviewsUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/reviews", COMPANYPREFIX, companyName]];
    result.reviews = [reviewsParser getReviewsWithUrl:reviewsUrl andAddress:@"//div[@class='widget-reviews']/div[@class='review item-body']"];

    return result;
}


@end
