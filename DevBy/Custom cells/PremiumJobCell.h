//
//  PremiumJobCell.h
//  DevBy
//
//  Created by Anastasia on 4/21/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PremiumJob;

@interface PremiumJobCell : UITableViewCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)PremiumJob * job;

-(void)drawCell;

@end
