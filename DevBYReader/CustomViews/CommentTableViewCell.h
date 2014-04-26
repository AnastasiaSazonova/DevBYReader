//
//  CommentTableViewCell.h
//  DynamicCellHeightSample
//
//  Created by Admin on 4/20/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface CommentTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (assign, nonatomic) NSInteger depth;

- (CGFloat)getHeight;
- (void)defineRects;

@end
