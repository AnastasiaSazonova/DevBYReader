//
//  PremiumJobCell.h
//  DevBy
//
//  Created by Anastasia on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
@class PremiumJob;
#import "StandardJobCell.h"

@interface PremiumJobCell : StandardJobCell
=======
@class Job;

@interface PremiumJobCell : UITableViewCell
>>>>>>> sazonova

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)Job * job;

-(void)drawCell;

@end
