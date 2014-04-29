//
//  MiddleJobCellTableViewCell.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StandardJobCell.h"
@class Job;
@class MiddleJob;

@interface MiddleJobCell : StandardJobCell

@property(nonatomic, strong)MiddleJob * job;
-(void)drawCell;

@end
