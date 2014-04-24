//
//  StandardJobCell.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Job;

@interface StandardJobCell : UITableViewCell

@property(nonatomic, strong)Job * job;
-(void)drawCell;
@property(nonatomic, assign, readonly)float totalHeight;

@end
