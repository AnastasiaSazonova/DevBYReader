//
//  TextConverter.h
//  HTMLParsing
//
//  Created by Admin on 5/5/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"

@interface TextConverter : NSObject

- (NSString *)getText:(NSArray *)htmlElements;
- (NSData *)clearHtmlData:(NSData *)data;

@end
