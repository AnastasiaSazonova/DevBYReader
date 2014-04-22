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
- (id)initWithStyle:(UITableViewCellStyle)style name:(NSString *)name reuseIdentifier:(NSString *)reuseIdentifier;


@end
