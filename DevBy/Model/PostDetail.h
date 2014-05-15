//
//  PostDetail.h
//  DevBy
//
//  Created by Admin on 5/15/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface PostDetail : Post

@property(nonatomic, strong)NSString * rate;
@property(nonatomic, strong)NSString * numberOfComments;
@property(nonatomic, strong)NSString * poster;
@property(nonatomic, strong)NSString * content;

@end
