//
//  PremiumJobCell.h
//  DevBy
//
//  Created by Anastasia on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@class Job;

@interface PremiumJobCell : CustomCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)Job * job;

@end
