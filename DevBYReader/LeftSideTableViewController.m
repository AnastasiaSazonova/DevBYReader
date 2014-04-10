//
//  LeftSideTableViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "LeftSideTableViewController.h"
#import "SWRevealViewController.h"
#import "PostsViewController.h"
#import "CompaniesViewController.h"
#import "VacanciesViewController.h"
#import "EventsViewController.h"
#import "TFHpple.h"
#import "HTMLElement.h"

@interface LeftSideTableViewController ()
{
    NSArray * _objects;
}

@end

@implementation LeftSideTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}

- (void)loadMenuItems
{
    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://dev.by"];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
    NSString *tutorialsXpathQueryString = @"//ul[@class='menu']/li/a";
    
    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];

    NSMutableArray *menuItems = [[NSMutableArray alloc] initWithCapacity:0];
    for (TFHppleElement *element in tutorialsNodes)
    {
    
        HTMLElement *menuItem = [[HTMLElement alloc] init];
        [menuItems addObject:menuItem];
    
        menuItem.title = [[element firstChild] content];
        //NSLog(@"%@", menuItem.title);
        // menuItem.url = [element objectForKey:@"href"];
        // NSLog(@"%@", menuItem.url);
    }
    
    _objects = @[@"Главная", @"Компании", @"Вакансии", @"События"];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Dev.by";
    [self loadMenuItems];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //HTMLElement *thisTutorial = [_objects objectAtIndex:indexPath.row];
    cell.textLabel.text = _objects[indexPath.row];
    //cell.detailTextLabel.text = thisTutorial.url;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        PostsViewController * postsViewController = [[PostsViewController alloc] init];
        [self.navigationController pushViewController:postsViewController animated:YES];
    }
    else if (indexPath.row == 1)
    {
        CompaniesViewController * companiesVC = [[CompaniesViewController alloc] init];
        [self.navigationController pushViewController:companiesVC animated:YES];
    }
    else if (indexPath.row == 2)
    {
        VacanciesViewController * vacanciesVC = [[VacanciesViewController alloc] init];
        [self.navigationController pushViewController:vacanciesVC animated:YES];
    }
    else if (indexPath.row == 3)
    {
        EventsViewController * eventsVC = [[EventsViewController alloc] init];
        [self.navigationController pushViewController:eventsVC animated:YES];
    }
}

- (void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Comming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
