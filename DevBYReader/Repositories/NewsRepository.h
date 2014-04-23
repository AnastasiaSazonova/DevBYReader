//
//  NewsRepository.h
//  DevBYReader
//
//  Created by Admin on 4/17/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailModel.h"
#import "NewsModel.h"

@interface NewsRepository : NSObject

- (NSArray *)getNewsList;
- (NewsDetailModel *)getNewsDetailModel:(NSInteger)newsId_;

@end
