//
//  Job.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Job : NSObject

@property(nonatomic, assign)int type;
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * url;
@property(nonatomic, strong)NSString * companysName;
@property(nonatomic, strong)NSString * pictureUrl;
@property(nonatomic, strong)NSString * description;

@end