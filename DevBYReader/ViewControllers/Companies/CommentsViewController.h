//
//  CommentsViewController.h
//  DevBYReader
//
//  Created by Admin on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
#import "CommentRepository.h"
#import "CommentTableViewCell.h"
#import "Constants.h"

@interface CommentsViewController : UITableViewController

- (id)initWithEventId:(NSInteger)eventId_;

@end
