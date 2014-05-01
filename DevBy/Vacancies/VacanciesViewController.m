//
//  VacanciesViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "VacanciesViewController.h"
#import "DetailVacanciesViewController.h"
#import "PremiumJobCell.h"
#import "MiddleJobCell.h"
#import "Job.h"
#import "StandardJobCell.h"
#import "Constants.h"

@interface VacanciesViewController()<UISearchDisplayDelegate, UISearchBarDelegate>
{
    UISearchDisplayController * searchDisplayController;
    float tableviewOffset;
    BOOL isSearching;
}

@property(nonatomic, strong)NSArray * jobs;
@property(nonatomic, strong)NSMutableArray * searchResults;
@property(nonatomic, strong)UITableView * tableView;
@property(nonatomic, strong)UISearchBar * searchBar;

@end

@implementation VacanciesViewController

-(NSArray *)jobs
{
    if (!_jobs)
    {
        Job * premiumJob1 = [[Job alloc] init];
        premiumJob1.type = premiumType;
        premiumJob1.name = @"1Руководитель команды аналитиков";
        premiumJob1.companysName = @"A1QA";
        premiumJob1.description = @"1Требуется опытный руководитель для организации работы и развития команды системных и бизнес-аналитиков, способный разрабатывать стратегию развития команды, планировать ее работу, эффективно организовывать деятельность.";
        premiumJob1.pictureUrl = nil;
        
        Job * premiumJob2 = [[Job alloc] init];
        premiumJob2.type = premiumType;
        premiumJob2.name = @"2An Extraordinary Project for Senior .NET Software Engineer";
        premiumJob2.companysName = @"NUBIKO";
        premiumJob2.description = @"2We are looking for a talented senior .NET programmer for developing of innovative, extraordinary software product called TRIGGRE based on the latest Microsoft technologies. Product Description What’s your Triggre?";
        premiumJob2.pictureUrl = nil;
        
        Job * premiumJob3 = [[Job alloc] init];
        premiumJob3.type = premiumType;
        premiumJob3.name = @"3.Net разработчик со знанием немецкого языка";
        premiumJob3.companysName = @"SaM Solutions";
        premiumJob3.description = @"3Требуется опытный руководитель для организации работы и развития команды системных и бизнес-аналитиков, способный разрабатывать стратегию развития команды, планировать ее работу, эффективно организовывать деятельность.";
        premiumJob3.pictureUrl = nil;
        
        Job * standardJob1 = [[Job alloc] init];
        standardJob1.type = standardType;
        standardJob1.name = @"1Junior ASP.Net MVC developer";
        standardJob1.companysName = @"Elilink Consulting";
        
        Job * standardJob2 = [[Job alloc] init];
        standardJob2.type = standardType;
        standardJob2.name = @"2DACH Business Development Manager";
        standardJob2.companysName = @"SaM Solutions";
        
        Job * standardJob3 = [[Job alloc] init];
        standardJob3.type = standardType;
        standardJob3.name = @"3Senior Front-end Developer (Могилев)";
        standardJob3.companysName = @"EPAM Systems";
        
        Job * standardJob4 = [[Job alloc] init];
        standardJob4.type = standardType;
        standardJob4.name = @"4Главный тестировщик";
        standardJob4.companysName = @"Сбербанк-Технологии";
      
        Job * middleJob1 = [[Job alloc] init];
        middleJob1.type = middleType;
        middleJob1.name = @"1Руководитель команды аналитиков";
        middleJob1.companysName = @"A1QA";
        
        Job * middleJob2 = [[Job alloc] init];
        middleJob2.type = middleType;
        middleJob2.name = @"2An Extraordinary Project for Senior .NET Software Engineer";
        middleJob2.companysName = @"NUBIKO";
        
        Job * middleJob3 = [[Job alloc] init];
        middleJob3.type = middleType;
        middleJob3.name = @"3.Net разработчик со знанием немецкого языка";
        middleJob3.companysName = @"SaM Solutions";
        
        _jobs = @[premiumJob1, premiumJob2, premiumJob3, standardJob1, standardJob4, middleJob3, standardJob2, middleJob1,
                  middleJob2, standardJob3];
    }
    return _jobs;
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
    isSearching = NO;
    self.title = NSLocalizedString(@"Вакансии", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchBar = [[UISearchBar alloc] init];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    
    [self.searchBar setShowsScopeBar:NO];
    [self.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchBar;
    
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + self.searchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(goToSearch:)];
    self.navigationItem.rightBarButtonItem = searchButton;
}

- (IBAction)goToSearch:(id)sender
{
    [self.searchBar becomeFirstResponder];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self rowHeightinTableView:tableView ForIndexPath:indexPath];
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
        return [self.jobs count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [self configureCell:cell inTableView:tableView AtIndexPath:indexPath];
    return cell;
}

-(UITableViewCell *)configureCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath
{
    Job * currentJob;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        currentJob = self.searchResults[indexPath.row];
    }
    else
    {
        currentJob = self.jobs[indexPath.row];
    }
    if (currentJob.type == premiumType)
    {
        cell = [[PremiumJobCell alloc] init];
        PremiumJobCell * newCell = (PremiumJobCell *)cell;
        newCell.job = currentJob;
        [newCell drawCell];
    }
    else if(currentJob.type == middleType)
    {
        cell = [[MiddleJobCell alloc] init];
        MiddleJobCell * newCell = (MiddleJobCell *)cell;
        newCell.job = currentJob;
        [newCell drawCell];
    }
    else if (currentJob.type == standardType)
    {
        cell = [[StandardJobCell alloc] init];
        StandardJobCell * newCell = (StandardJobCell *)cell;
        newCell.job = currentJob;
        [newCell drawCell];
    }

    return cell;
}

-(float)rowHeightinTableView:(UITableView *)tableView ForIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    Job * currentJob;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        currentJob = self.searchResults[indexPath.row];
    }
    else
    {
        currentJob = self.jobs[indexPath.row];
    }
    if (currentJob.type == premiumType)
    {
        cell = [[PremiumJobCell alloc] init];
        PremiumJobCell * newCell = (PremiumJobCell *)cell;
        newCell.job = currentJob;
        [newCell drawCell];
        return newCell.totalHeight;
    }
    else if(currentJob.type == middleType)
    {
        cell = [[MiddleJobCell alloc] init];
        MiddleJobCell * newCell = (MiddleJobCell *)cell;
        newCell.job = currentJob;
        [newCell drawCell];
        return newCell.totalHeight;
    }
    else if (currentJob.type == standardType)
    {
        cell = [[StandardJobCell alloc] init];
        StandardJobCell * newCell = (StandardJobCell *)cell;
        newCell.job = currentJob;
        [newCell drawCell];
        return newCell.totalHeight;
    }

    return 0;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    [self.searchResults removeAllObjects];
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"name contains[cd] %@",
                                    searchText];
    
    self.searchResults = [NSMutableArray arrayWithArray:[self.jobs filteredArrayUsingPredicate:resultPredicate]];
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
    DetailVacanciesViewController * detailVacancyViewController = [[DetailVacanciesViewController alloc] init];
    Job * job;
    if (self.searchDisplayController.active)
    {
        indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        job = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        indexPath = [tableView indexPathForSelectedRow];
        job = [self.jobs objectAtIndex:indexPath.row];
    }
    detailVacancyViewController.jobTitle = job.name;
    [self.navigationController pushViewController:detailVacancyViewController animated:YES];
}

@end
