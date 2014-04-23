//
//  NewsModel.m
//  DevBYReader
//
//  Created by Admin on 4/16/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

@synthesize newsId;
@synthesize title;
@synthesize time;
@synthesize imageName;

- (id)initWithId:(NSInteger)newsId_ andTitle:(NSString *)title_ andTime:(NSString *)time_ andImageName:(NSString *)imageName_ 
{
    self = [super init];
    if(self)
    {
        self.newsId = newsId_;
        self.title = title_;
        self.time = time_;
        self.imageName = imageName_;
    }
    return self;
}

@end
