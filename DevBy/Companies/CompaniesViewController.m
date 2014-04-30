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
    UISearchBar * searchBar;
    UISearchDisplayController * searchDisplayController;
}


@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, strong)NSArray * companysNames;
@property(nonatomic, strong)NSMutableArray * searchResults;

@end

@implementation CompaniesViewController

-(NSArray *)companysNames
{
    if (!_companysNames)
    {
        _companysNames = @[@"Altoros", @"BPMobile", @"Cib Software", @"ISSoft", @"IT-Max (ASBIS, бренд Prestigio)", @"Представительство PamConsult Gmbh в Минске", @"EPAM", @"Exadel", @"Quilix Systems", @"WarGaming", @"Altoros", @"BPMobile", @"Cib Software", @"ISSoft", @"IT-Max (ASBIS, бренд Prestigio)", @"Представительство PamConsult Gmbh в Минске", @"EPAM", @"Exadel"];
    }
    return _companysNames;
}

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
    self.title = NSLocalizedString(@"Компании", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect searchBarRect = CGRectMake(0, navBarHeight, self.view.bounds.size.width, CVCRowHeight);
    searchBar = [[UISearchBar alloc] initWithFrame:searchBarRect];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    [self.view addSubview:searchBar];
    
    float tableOffset = navBarHeight + CVCRowHeight + 3;
    CGRect tableViewFrame = CGRectMake(0, tableOffset, self.view.bounds.size.width, self.view.frame.size.height - self.view.bounds.origin.y - tableOffset);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    if ([self.tableView numberOfRowsInSection:0] > 11)
    {
        [self.tableView sizeToFit];
    }

    [self.view addSubview:self.tableView];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(changeSearchBarPosition:) name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(changeSearchBarPosition:) name:UIKeyboardWillHideNotification object:nil];
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
            self.tableView.frame = CGRectMake(0, (navBarHeight + CVCRowHeight + 3), self.tableView.bounds.size.width, self.tableView.bounds.size.height);
        }];
    }
    
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
    int cellContentLength = (int)[arrayOfData[indexPath.row] length];
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
        companysName = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        companysName = [self.companysNames objectAtIndex:indexPath.row];
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
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    self.searchResults = [NSMutableArray arrayWithArray:[self.companysNames filteredArrayUsingPredicate:resultPredicate]];
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
        companysName = [self.searchResults objectAtIndex:indexPath.row];
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
