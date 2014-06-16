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
#import "CommentsParser.h"
#import "Constants.h"
#import "AFNetworking.h"
#import "CommentsSerializer.h"

@interface CommentsViewController ()
{
    NSString *companyLink;
    NSArray *objects;
    
    UIActivityIndicatorView *loadingSpinner;
    AFHTTPRequestOperationManager *requestOperationManager;
}
@end

@implementation CommentsViewController

- (id)initWithCompany:(NSString *)link;
{
    self = [super init];
    if(self)
    {
        companyLink = link;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //////
    NSURL *commentsUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", COMPANYPREFIX, companyLink]];
    
    loadingSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loadingSpinner.frame = self.view.frame;
    [loadingSpinner startAnimating];
    self.view.userInteractionEnabled = NO;
    [self.view addSubview:loadingSpinner];
    
    requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:commentsUrl];
    CommentsSerializer *commentsSerializer = [[CommentsSerializer alloc] initWithWithUrl:commentsUrl andAddress:companyLink];
    requestOperationManager.responseSerializer = commentsSerializer;
    [requestOperationManager GET:[NSString stringWithFormat:@"%@%@", COMPANYPREFIX, companyLink]
                      parameters:nil
                         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         objects = [NSArray arrayWithArray:(NSArray *)responseObject];
         [self.tableView reloadData];
         [loadingSpinner stopAnimating];
         self.view.userInteractionEnabled = YES;
         
     }failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if(error.code != -999)
         {
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка"
                                                                 message:[error localizedDescription]
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
             [alertView show];
         }
     }];
    //////
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
    [requestOperationManager.operationQueue cancelAllOperations];
    [loadingSpinner stopAnimating];    
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
