//
//  MiddleJobCellTableViewCell.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "StandardJobCell.h"
@class Job;
@class MiddleJob;

@interface MiddleJobCell : StandardJobCell

@property(nonatomic, strong)MiddleJob * job;
=======
@class Job;

@interface MiddleJobCell : UITableViewCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)Job * job;

>>>>>>> sazonova
-(void)drawCell;

@end
