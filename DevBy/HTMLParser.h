//
//  HTMLParser.h
//  DevBy
//
//  Created by Anastasia on 5/17/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLParser : NSObject



+(HTMLParser *)sharedInstance;
- (void)startParseCategory:(NSString *)identifier andPostfixOfUrl:(NSString *) postfix;


@end
