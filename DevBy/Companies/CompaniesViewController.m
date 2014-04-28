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

@interface CompaniesViewController()<UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    NSMutableArray * searchResults;
    UISearchBar * searchBar;
    UISearchDisplayController * searchDisplayController;
}

@property(nonatomic, strong)UITableView * tableView;
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
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    [self.view addSubview:searchBar];
    
    CGRect tableViewFrame = CGRectMake(0, navBarHeight + CVCRowHeight + 3, self.view.bounds.size.width, self.view.bounds.size.height - self.view.bounds.origin.y);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    if ([self.tableView numberOfRowsInSection:0] > 11)
    {
        [self.tableView sizeToFit];
    }
    //tableView.tableHeaderView = searchBar;
    [self.view addSubview:self.tableView];
    searchResults = [[NSMutableArray alloc] init];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(changeSearchBarPosition:) name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(changeSearchBarPosition:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // get the table and search bar bounds
    //CGRect tableBounds = tableView.bounds;
    CGRect searchBarFrame = searchBar.frame;
    
    // make sure the search bar stays at the table's original x and y as the content moves
    searchBar.frame = CGRectMake(0,
                                      navBarHeight,
                                      searchBarFrame.size.width,
                                      searchBarFrame.size.height
                                      );
}

-(void)changeSearchBarPosition:(NSNotification *)notification
{
    float statusbarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    if ([notification.name isEqualToString:UIKeyboardWillShowNotification])
    {
        [UIView animateWithDuration:0.25 animations:^{
            searchBar.frame =  CGRectMake(0,
                                          statusbarHeight,
                                          searchBar.bounds.size.width,
                                          searchBar.bounds.size.height
                                          );
            self.tableView.frame = CGRectMake(0, statusbarHeight + CVCRowHeight + 4, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
        }];
    }
    else if([notification.name isEqualToString:UIKeyboardWillHideNotification])
    {
        [UIView animateWithDuration:0.25 animations:^{
            searchBar.frame =  CGRectMake(0,
                                          navBarHeight,
                                          searchBar.bounds.size.width,
                                          searchBar.bounds.size.height
                                          );
            self.tableView.frame = CGRectMake(0, navBarHeight + CVCRowHeight + 4, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
        }];
    }
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
