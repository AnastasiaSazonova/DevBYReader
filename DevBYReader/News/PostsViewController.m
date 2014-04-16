//
//  PostsTableViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "PostsViewController.h"
#import "TFHpple.h"
#import "HTMLElement.h"
#import "DetailPostsViewController.h"
#import "MainArticleCell.h"
#import "ArticleCell.h"

@interface PostsViewController ()
{
    NSMutableArray * _posts;
}

@end

@implementation PostsViewController

-(void)loadPosts
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Главная", nil);
    _posts = [[NSMutableArray alloc] initWithArray:@[@"Злой гений создал гибрид '2048' и 'Flappy Bird' на погибель вашей продуктивности.", @"Heartbleed – новое слово в маркетинге багов.", @"Злой гений создал гибрид '2048' и 'Flappy Bird' на погибель вашей продуктивности.", @"Р.Столлман – Дзен свободного программирования. Часть 2"]];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_posts count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int postsTitleLength = [_posts[indexPath.row] length];
    if (indexPath.row == 0)
    {
        return self.view.bounds.size.height/3 + 7;
    }
    if (postsTitleLength > 60)
    {
        return (self.view.bounds.size.height*0.22 - 15);
    }
  
    return self.view.bounds.size.height*0.22 - 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[MainArticleCell alloc] initWithHeight:self.view.bounds.size.height/3 title:_posts[indexPath.row] reuseIdentifier:CellIdentifier];
        }
    }
    
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[ArticleCell alloc] initWithHeight:self.view.bounds.size.height*0.22 - 22 title:_posts[indexPath.row] reuseIdentifier:CellIdentifier];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPostsViewController * detailViewController = [[DetailPostsViewController alloc] init];
    detailViewController.title = _posts[indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Main" message:@"Comming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
