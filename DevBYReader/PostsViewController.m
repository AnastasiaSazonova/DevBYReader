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

@interface PostsViewController ()
{
    NSMutableArray * _posts;
}

@end

@implementation PostsViewController

-(void)loadPosts
{
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://dev.by"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    TFHpple *postsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
    NSString *tutorialsXpathQueryString = @"//div[@class='blog-node-top']/h2/a";
    
    NSArray *tutorialsNodes = [postsParser searchWithXPathQuery:tutorialsXpathQueryString];
    
    //NSLog(@"count %@", tutorialsNodes[0]);
    NSMutableArray *posts = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in tutorialsNodes) {
        // 5
        HTMLElement *currentPost = [[HTMLElement alloc] init];
        [posts addObject:currentPost];
        // 6
        currentPost.title = [[element firstChild] content];
        // 7
        // menuItem.url = [element objectForKey:@"href"];
        // NSLog(@"%@", menuItem.url);
    }
    
    _posts = posts;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Dev.by", nil);
    _posts = [[NSMutableArray alloc] initWithArray:@[@"0", @"1"]];
    [self.tableView reloadData];
    //[self showAlert];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //HTMLElement *thisTutorial = [_posts objectAtIndex:indexPath.row];
    cell.textLabel.text = _posts[indexPath.row];
     
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPostsViewController * detailViewController = [[DetailPostsViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Main" message:@"Comming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
