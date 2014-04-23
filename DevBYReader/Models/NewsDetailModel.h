//
//  NewsDetailModel.h
//  DevBYReader
//
//  Created by Admin on 4/17/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDetailModel : NSObject

@property (assign, nonatomic) NSInteger newsId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *description;

@end
