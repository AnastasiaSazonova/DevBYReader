//
//  CompaniesViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CompaniesViewController.h"
#import "DetailCompanyViewController.h"


@interface CompaniesViewController()<UISearchDisplayDelegate>
{
    NSMutableArray * searchResults;
    UISearchBar * searchBar;
    UISearchDisplayController * searchDisplayController;
    BOOL isSearching;
    float rowHeight;
    float maxCharsPerRow;
}

@property(nonatomic, strong)NSArray * companysNames;

@end

@implementation CompaniesViewController

-(NSArray *)companysNames
{
    if (!_companysNames)
    {
        _companysNames = @[@"Altoros", @"BPMobile", @"Cib Software", @"ISSoft", @"IT-Max (ASBIS, бренд Prestigio)", @"Представительство PamConsult Gmbh в Минске", @"EPAM", @"Exadel", @"Quilix Systems", @"WarGaming"];
    }
    return _companysNames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Компании", nil);
    rowHeight = 40;
    maxCharsPerRow = 30;
    
    searchBar = [[UISearchBar alloc] init];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    self.tableView.tableHeaderView = searchBar;
    searchResults = [[NSMutableArray alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cellContentLength = (int)[self.companysNames[indexPath.row] length];
    if (cellContentLength > maxCharsPerRow)
    {
        return rowHeight * cellContentLength/maxCharsPerRow;
    }
    return rowHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [searchResults count];
        
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
        companysName = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        companysName = [self.companysNames objectAtIndex:indexPath.row];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = companysName;
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    [searchResults removeAllObjects];
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [NSMutableArray arrayWithArray:[self.companysNames filteredArrayUsingPredicate:resultPredicate]];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCompanyViewController * detailCompanyViewController = [[DetailCompanyViewController alloc] init];
    detailCompanyViewController.companysName = self.companysNames[indexPath.row];
    [self.navigationController pushViewController:detailCompanyViewController animated:YES];
}

@end
