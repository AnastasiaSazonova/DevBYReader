//
//  CompaniesViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CompaniesViewController.h"
#import "DetailCompanyViewController.h"
#import "Constants.h"


@interface CompaniesViewController()<UISearchDisplayDelegate, UISearchBarDelegate>
{
    UISearchDisplayController * searchDisplayController;
    CompaniesParser *companiesParser;
}


@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, strong)NSArray * companysNames;
@property(nonatomic, strong)NSMutableArray * searchResults;
@property(nonatomic, strong)UISearchBar * searchBar;

@end

@implementation CompaniesViewController

-(NSArray *)searchResults
{
    if (!_searchResults)
    {
        _searchResults = [[NSMutableArray alloc] init];
    }
    return _searchResults;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    companiesParser = [[CompaniesParser alloc] init];
    self.companysNames = [companiesParser getCompanies];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect searchBarRect = CGRectMake(0, navBarHeight, self.view.bounds.size.width, CVCRowHeight);
    self.searchBar = [[UISearchBar alloc] initWithFrame:searchBarRect];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    self.tableView.tableHeaderView = self.searchBar;
    [self.searchBar setShowsScopeBar:NO];
    [self.searchBar sizeToFit];
    
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + self.searchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(goToSearch:)];
    self.navigationItem.rightBarButtonItem = searchButton;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Компании" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (IBAction)goToSearch:(id)sender
{
    [self.searchBar becomeFirstResponder];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self heightForRowFrom:self.searchResults AtIndexPath:indexPath];
    }
    else
    {
        if (indexPath.row == 0)
        {
            return CVCRowHeight;
        }
        else
        {
            return [self heightForRowFrom:self.companysNames AtIndexPath:indexPath];
        }
    }
    return 0;
}

-(float)heightForRowFrom:(NSArray *)arrayOfData AtIndexPath:(NSIndexPath *)indexPath
{
    int cellContentLength = (int)[[arrayOfData[indexPath.row] name] length];
    if (cellContentLength > CVCMaxCharsPerRow)
    {
        return CVCRowHeight * cellContentLength/CVCMaxCharsPerRow;
    }
    else
    {
        return CVCRowHeight;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.searchResults count];
        
    }
    else
    {
        return [self.companysNames count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    NSString *companysName = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        companysName = [[self.searchResults objectAtIndex:indexPath.row] name];
    }
    else
    {
        companysName = [[self.companysNames objectAtIndex:indexPath.row] name];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = companysName;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    [self.searchResults removeAllObjects];
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.NAME contains[cd] %@",
                                    searchText];
    
    //self.searchResults = [NSMutableArray arrayWithArray:[self.companysNames filteredArrayUsingPredicate:resultPredicate]];  //? search bug after adding a customArray
    ////
    NSArray *new = [self.companysNames filteredArrayUsingPredicate:resultPredicate];
    self.searchResults = [NSMutableArray arrayWithArray:new];
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    return YES;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCompanyViewController * detailCompanyViewController = [[DetailCompanyViewController alloc] init];
    NSString * companysName;
    if (self.searchDisplayController.active)
    {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        companysName = [[self.searchResults objectAtIndex:indexPath.row] name];
    }
    else
    {
        indexPath = [tableView indexPathForSelectedRow];
        companysName = [[self.companysNames objectAtIndex:indexPath.row] name];
    }
    //detailCompanyViewController.companysName = companysName;  //!
    [self.navigationController pushViewController:detailCompanyViewController animated:YES];
}

@end
