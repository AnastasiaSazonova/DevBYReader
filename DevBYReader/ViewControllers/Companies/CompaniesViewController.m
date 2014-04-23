//
//  CompaniesViewController.m
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "CompaniesViewController.h"

@interface CompaniesViewController ()

@end

@implementation CompaniesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.title = @"Компании";
        
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50);
        [self.view addSubview:searchBar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.textLabel.text = @"Company";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    #warning insert conent
}

@end
