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
#import "PremiumJob.h"
#import "MiddleJobCell.h"
#import "Job.h"
#import "StandardJobCell.h"
#import "MiddleJob.h"

NSString * premiumJobIdentifier = @"PremiunJob";
NSString * middleJobIdentifier = @"MiddleJob";
NSString * standardJobIdentifier = @"StandardJob";

@interface VacanciesViewController()<UISearchDisplayDelegate>
{
    UISearchBar * searchBar;
    UISearchDisplayController * searchDisplayController;
    BOOL isSearching;
    float rowHeight;
    float maxCharsPerRow;
}

@property(nonatomic, strong)NSArray * jobs;
@property(nonatomic, strong)NSArray * middleJobs;
@property(nonatomic, strong)NSArray * searchResults;

@end

@implementation VacanciesViewController

-(NSArray *)jobs
{
    if (!_jobs)
    {
        PremiumJob * premiumJob1 = [[PremiumJob alloc] init];
        premiumJob1.name = @"1Руководитель команды аналитиков";
        premiumJob1.companysName = @"A1QA";
        premiumJob1.description = @"1Требуется опытный руководитель для организации работы и развития команды системных и бизнес-аналитиков, способный разрабатывать стратегию развития команды, планировать ее работу, эффективно организовывать деятельность.";
        premiumJob1.pictureUrl = nil;
        PremiumJob * premiumJob2 = [[PremiumJob alloc] init];
        premiumJob2.name = @"2An Extraordinary Project for Senior .NET Software Engineer";
        premiumJob2.companysName = @"NUBIKO";
        premiumJob2.description = @"2We are looking for a talented senior .NET programmer for developing of innovative, extraordinary software product called TRIGGRE based on the latest Microsoft technologies. Product Description What’s your Triggre?";
        premiumJob2.pictureUrl = nil;
        PremiumJob * premiumJob3 = [[PremiumJob alloc] init];
        premiumJob3.name = @"3.Net разработчик со знанием немецкого языка";
        premiumJob3.companysName = @"SaM Solutions";
        premiumJob3.description = @"3Требуется опытный руководитель для организации работы и развития команды системных и бизнес-аналитиков, способный разрабатывать стратегию развития команды, планировать ее работу, эффективно организовывать деятельность.";
        premiumJob3.pictureUrl = nil;
        PremiumJob * premiumJob4 = [[PremiumJob alloc] init];
        premiumJob4.name = @"4Java developer (eCommerce Hybris)";
        premiumJob4.companysName = @"SaM Solutions";
        premiumJob4.description = @"4Приглашаяем в SaM Solutions разработчика на платформе Hybris Должностные обязанности: ∙ Разработка интернет- решений на базе платформы Hybris; ∙ Реализация интеграционных проектов на базе платформы Hybris. Требования: ∙ Высшее т ...";
        premiumJob4.pictureUrl = nil;
        PremiumJob * premiumJob5 = [[PremiumJob alloc] init];
        premiumJob5.name = @"5Ios разработчик со знанием немецкого языка";
        premiumJob5.companysName = @"SaM Solutions";
        premiumJob5.description = @"5Требуется опытный руководитель для организации работы и развития команды системных и бизнес-аналитиков, способный разрабатывать стратегию развития команды, планировать ее работу, эффективно организовывать деятельность.";
        premiumJob5.pictureUrl = nil;
        PremiumJob * premiumJob6 = [[PremiumJob alloc] init];
        premiumJob6.name = @"6Android developer (eCommerce Hybris)";
        premiumJob6.companysName = @"SaM Solutions";
        premiumJob6.description = @"6Приглашаяем в SaM Solutions разработчика на платформе Hybris Должностные обязанности: ∙ Разработка интернет- решений на базе платформы Hybris; ∙ Реализация интеграционных проектов на базе платформы Hybris. Требования: ∙ Высшее т ...";
        premiumJob6.pictureUrl = nil;

        _jobs = @[premiumJob1, premiumJob2, premiumJob3, premiumJob4, premiumJob5, premiumJob6];
    }
    return _jobs;
}

-(NSArray *)middleJobs
{
    if (!_middleJobs)
    {
        MiddleJob * premiumJob1 = [[MiddleJob alloc] init];
        premiumJob1.name = @"1Руководитель команды аналитиков";
        premiumJob1.companysName = @"A1QA";
        MiddleJob * premiumJob2 = [[MiddleJob alloc] init];
        premiumJob2.name = @"2An Extraordinary Project for Senior .NET Software Engineer";
        premiumJob2.companysName = @"NUBIKO";
        MiddleJob * premiumJob3 = [[MiddleJob alloc] init];
        premiumJob3.name = @"3.Net разработчик со знанием немецкого языка";
        premiumJob3.companysName = @"SaM Solutions";
        
        MiddleJob * premiumJob4 = [[MiddleJob alloc] init];
        premiumJob4.name = @"4Java developer (eCommerce Hybris)";
        premiumJob4.companysName = @"SaM Solutions";
        
        MiddleJob * premiumJob5 = [[MiddleJob alloc] init];
        premiumJob5.name = @"5Ios разработчик со знанием немецкого языка";
        premiumJob5.companysName = @"SaM Solutions";
        
        MiddleJob * premiumJob6 = [[MiddleJob alloc] init];
        premiumJob6.name = @"6Android developer (eCommerce Hybris)";
        premiumJob6.companysName = @"SaM Solutions";
        
        _middleJobs = @[premiumJob1, premiumJob2, premiumJob3, premiumJob4, premiumJob5, premiumJob6];
    }
    return _middleJobs;
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
    self.title = NSLocalizedString(@"Вакансии", nil);
    rowHeight = 40;
    maxCharsPerRow = 30;
    
    [self.tableView registerClass:[PremiumJobCell class] forCellReuseIdentifier:premiumJobIdentifier];
    [self.tableView registerClass:[MiddleJobCell class] forCellReuseIdentifier:middleJobIdentifier];
    [self.tableView registerClass:[StandardJobCell class] forCellReuseIdentifier:standardJobIdentifier];
    searchBar = [[UISearchBar alloc] init];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    self.tableView.tableHeaderView = searchBar;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.font = [UIFont systemFontOfSize:13];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StandardJobCell *cell;
    cell = [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:premiumJobIdentifier];
    [self configureCell:cell inTableView:self.tableView AtIndexPath:indexPath];
    return cell.totalHeight;
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
    StandardJobCell *cell;
    cell = [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:premiumJobIdentifier];
    [self configureCell:cell inTableView:tableView AtIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(StandardJobCell *)cell inTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.job = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        cell.job = [self.jobs objectAtIndex:indexPath.row];
    }
    [cell drawCell];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    self.searchResults = [self.jobs filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Job *job = nil;
    
    if (self.searchDisplayController.active)
    {
        job = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        job = [self.jobs objectAtIndex:indexPath.row];
    }
    DetailVacanciesViewController * detailVacanciesVC = [[DetailVacanciesViewController alloc] init];
    detailVacanciesVC.jobTitle = job.name;
    [self.navigationController pushViewController:detailVacanciesVC animated:YES];
}

@end
