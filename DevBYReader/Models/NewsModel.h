//
//  NewsModel.h
//  DevBYReader
//
//  Created by Admin on 4/16/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (assign, nonatomic) NSInteger newsId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *imageName;

- (id)initWithId:(NSInteger)newsId_ andTitle:(NSString *)title_ andTime:(NSString *)time_ andImageName:(NSString *)imageName_;

@end
