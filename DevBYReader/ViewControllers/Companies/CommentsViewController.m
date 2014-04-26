//
//  CommentsViewController.m
//  DevBYReader
//
//  Created by Admin on 4/26/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()
{
    CommentRepository *commentRepository;
    NSArray *commentsList;
    NSMutableArray *commentTableViewCellList;
}
@end

@implementation CommentsViewController

- (id)initWithEventId:(NSInteger)eventId_
{
    self = [super init];
    if (self)
    {
        commentRepository = [[CommentRepository alloc] init];
        commentsList =[commentRepository getCommentsList];
        commentTableViewCellList = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return commentsList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    CommentTableViewCell *cell = (CommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    Comment *currentComment = [commentsList objectAtIndex:indexPath.row];
    cell.authorLabel.text = currentComment.author;
    cell.timeLabel.text = currentComment.time;
    cell.textLabel.text = currentComment.text;
    cell.depth = currentComment.depth;
    
    [commentTableViewCellList addObject:cell];
    [cell defineRects];
    
    return [cell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return commentTableViewCellList[indexPath.row];
}


@end
