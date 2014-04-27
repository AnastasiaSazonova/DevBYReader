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

@interface CompaniesViewController()<UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * searchResults;
    UISearchBar * searchBar;
    UISearchDisplayController * searchDisplayController;
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
    
    CGRect searchBarRect = CGRectMake(0, navBarHeight, self.view.bounds.size.width, CVCRowHeight);
    searchBar = [[UISearchBar alloc] initWithFrame:searchBarRect];
    searchBar.delegate = self;
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    [self.view addSubview:searchBar];
    
    CGRect tableViewFrame = CGRectMake(0, navBarHeight + CVCRowHeight + 4, self.view.bounds.size.width, self.view.bounds.size.height - self.view.bounds.origin.y);
    UITableView * tableView = [[UITableView alloc] initWithFrame:tableViewFrame];
    tableView.delegate = self;
    tableView.dataSource = self;
    if ([tableView numberOfRowsInSection:0] > 11)
    {
        [tableView sizeToFit];
    }
    [self.view addSubview:tableView];
    searchResults = [[NSMutableArray alloc] init];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar");
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ,-\n"] invertedSet];
    NSString *filtered = [[text componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    return [text isEqualToString:filtered];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return CVCRowHeight;
    }
    int cellContentLength = (int)[self.companysNames[indexPath.row] length];
    if (cellContentLength > CVCMaxCharsPerRow)
    {
        return CVCRowHeight * cellContentLength/CVCMaxCharsPerRow;
    }
    return CVCRowHeight;
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
    NSString * companysName;
    if (self.searchDisplayController.active)
    {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        companysName = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        indexPath = [tableView indexPathForSelectedRow];
        companysName = [self.companysNames objectAtIndex:indexPath.row];
    }
    detailCompanyViewController.companysName = companysName;
    [self.navigationController pushViewController:detailCompanyViewController animated:YES];
}

@end