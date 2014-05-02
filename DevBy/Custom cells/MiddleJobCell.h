//
//  MiddleJobCellTableViewCell.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@class Job;

@interface MiddleJobCell : CustomCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)Job * job;

@end