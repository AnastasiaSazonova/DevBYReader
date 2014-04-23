//
//  EventCell.h
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)NSString * title;
@property(nonatomic, strong)NSString * date;
@property(nonatomic, strong)NSString * day;
@property(nonatomic, strong)NSString * description;
@property(nonatomic, strong)NSString * dayOfWeek;
-(void)drawCell;

@end
