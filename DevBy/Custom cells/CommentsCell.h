//
//  CommentsCell.h
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface CommentsCell : CustomCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)NSString * username;
@property(nonatomic, strong)NSString * date;
@property(nonatomic, strong)NSString * comment;

@end
