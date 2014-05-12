//
//  FeedbackCell.h
//  DevBy
//
//  Created by Anastasia on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CommentsViewController.h"
#import "Protocols.h"

@interface FeedbackCell : UITableViewCell

@property(nonatomic, assign, readonly)float totalHeight;
@property(nonatomic, strong)NSString * username;
@property(nonatomic, strong)NSString * date;
@property(nonatomic, strong)NSString * comment;
@property(nonatomic, strong)NSString * jobExperience;
@property(nonatomic, strong)NSString * rating;
@property(nonatomic, assign)Color color;
@property(nonatomic, assign)NSInteger commentsCount;
@property(nonatomic, strong)NSString *btnLink;
@property(nonatomic, strong)id<CommentsProtocol> delegate;

-(void)drawCell;

@end
