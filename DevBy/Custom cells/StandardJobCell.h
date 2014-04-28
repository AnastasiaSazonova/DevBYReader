//
//  StandardJobCell.h
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StandardJob.h"

@interface StandardJobCell : UITableViewCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)StandardJob * job;

-(void)drawCell;

@end
