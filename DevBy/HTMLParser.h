//
//  HTMLParser.h
//  DevBy
//
//  Created by Anastasia on 5/17/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTMLParserDelegate

- (void) parseData:(NSDictionary*) dataDictionary WithUrl:(NSString *)url andXPath:(NSString *) xpath;

@end

@interface HTMLParser : NSObject

+(HTMLParser *)sharedInstance;

@property(nonatomic, strong) id<HTMLParserDelegate> delegate;

- (void)startParseFromUrl:(NSString*)url andXPath:(NSString*) xpath;
- (void) finishParse;

@end
