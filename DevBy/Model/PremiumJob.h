//
//  PremiumJob.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Job.h"

@interface PremiumJob : NSObject<Job>

@property(nonatomic, strong)NSString * description;
@property(nonatomic, strong)NSURL * pictureUrl;

@end
