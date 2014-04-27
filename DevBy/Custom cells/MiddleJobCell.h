//
//  MiddleJobCellTableViewCell.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MiddleJob;

@interface MiddleJobCell : UITableViewCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)MiddleJob * job;
-(void)drawCell;

@end
