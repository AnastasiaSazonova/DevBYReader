//
//  EventsTableViewCell.h
//  DevBy
//
//  Created by Admin on 4/10/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface EventsTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *dateDetLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

- (CGFloat)getHeight;
- (void)defineRects;

@end
