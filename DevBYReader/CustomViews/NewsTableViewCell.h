//
//  NewsTableViewCell.h
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface NewsTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *thumbnailImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *timeLabel;

@end
