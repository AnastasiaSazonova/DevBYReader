//
//  CommentsViewController.m
//  DevBy
//
//  Created by Anastasia on 4/12/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsViewController.h"
#import "CommentsCell.h"
#import "Comment.h"

@interface CommentsViewController ()
{
    NSArray *objects;
}
@end

@implementation CommentsViewController

- (id)initWithComments:(NSArray *)comments
{
    self = [super init];
    if(self)
    {
        objects = comments;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return objects.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentsCell * cell = [[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
    return cell.totalHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentsCell * cell = [[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(CommentsCell *)cell inTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    Comment *comment = (Comment *)objects[indexPath.row];
    cell.username = comment.username;
    cell.date = comment.date;
    cell.comment = comment.comment;
    [cell drawCellWithOffset:comment.level];
}

@end
