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
#import "StandardJob.h"

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
        
        StandardJob * standardJob1 = [[StandardJob alloc] init];
        standardJob1.name = @"1Junior ASP.Net MVC developer";
        standardJob1.companysName = @"Elilink Consulting";
        StandardJob * standardJob2 = [[StandardJob alloc] init];
        standardJob2.name = @"2DACH Business Development Manager";
        standardJob2.companysName = @"SaM Solutions";
        StandardJob * standardJob3 = [[StandardJob alloc] init];
        standardJob3.name = @"3Senior Front-end Developer (Могилев)";
        standardJob3.companysName = @"EPAM Systems";
        StandardJob * standardJob4 = [[StandardJob alloc] init];
        standardJob4.name = @"4Главный тестировщик";
        standardJob4.companysName = @"Сбербанк-Технологии";
      
        MiddleJob * middleJob1 = [[MiddleJob alloc] init];
        middleJob1.name = @"1Руководитель команды аналитиков";
        middleJob1.companysName = @"A1QA";
        MiddleJob * middleJob2 = [[MiddleJob alloc] init];
        middleJob2.name = @"2An Extraordinary Project for Senior .NET Software Engineer";
        middleJob2.companysName = @"NUBIKO";
        MiddleJob * middleJob3 = [[MiddleJob alloc] init];
        middleJob3.name = @"3.Net разработчик со знанием немецкого языка";
        middleJob3.companysName = @"SaM Solutions";
        MiddleJob * middleJob4 = [[MiddleJob alloc] init];
        middleJob4.name = @"4Java developer (eCommerce Hybris)";
        middleJob4.companysName = @"SaM Solutions";
        MiddleJob * middleJob5 = [[MiddleJob alloc] init];
        middleJob5.name = @"5Ios разработчик со знанием немецкого языка";
        middleJob5.companysName = @"SaM Solutions";
        MiddleJob * middleJob6 = [[MiddleJob alloc] init];
        middleJob6.name = @"6Android developer (eCommerce Hybris)";
        middleJob6.companysName = @"SaM Solutions";
        
        _jobs = @[premiumJob1, premiumJob2, premiumJob3, premiumJob4, premiumJob5, premiumJob6,
                  middleJob1, standardJob1, standardJob4, middleJob3, standardJob2, middleJob5,
                  middleJob2, standardJob3, middleJob6];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.jobs[indexPath.row] isKindOfClass:[StandardJob class]])
    {

        StandardJobCell * cell = [[StandardJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:standardJobIdentifier];
        [self configureCell:cell inTableView:self.tableView AtIndexPath:indexPath];
        return cell.totalHeight;
    }
    else if([self.jobs[indexPath.row] isKindOfClass:[MiddleJob class]])
    {
        MiddleJobCell * cell = [[MiddleJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:middleJobIdentifier];
        [self configureCell:cell inTableView:self.tableView AtIndexPath:indexPath];
        return cell.totalHeight;
    }
    else
    {
        PremiumJobCell * cell = [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:premiumJobIdentifier];
        [self configureCell:cell inTableView:self.tableView AtIndexPath:indexPath];
        return cell.totalHeight;
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
        return [self.jobs count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if([self.jobs[indexPath.row] isKindOfClass:[StandardJob class]])
    {
        cell = [[StandardJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:standardJobIdentifier];
    }
    else if([self.jobs[indexPath.row] isKindOfClass:[MiddleJob class]])
    {
        cell = [[MiddleJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:middleJobIdentifier];
    }
    else
    {
        cell = [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:premiumJobIdentifier];
    }
    [self configureCell:cell inTableView:tableView AtIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[StandardJobCell class]])
    {
        StandardJobCell * newCell = (StandardJobCell *)cell;
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            newCell.job = [self.searchResults objectAtIndex:indexPath.row];
        }
        else
        {
            newCell.job = [self.jobs objectAtIndex:indexPath.row];
        }
        [newCell drawCell];
    }
    else if([cell isKindOfClass:[MiddleJobCell class]])
    {
        MiddleJobCell * newCell = (MiddleJobCell *)cell;
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            newCell.job = [self.searchResults objectAtIndex:indexPath.row];
        }
        else
        {
            newCell.job = [self.jobs objectAtIndex:indexPath.row];
        }
        [newCell drawCell];
    }
    else if([cell isKindOfClass:[PremiumJobCell class]])
    {
        PremiumJobCell * newCell = (PremiumJobCell *)cell;
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            newCell.job = [self.searchResults objectAtIndex:indexPath.row];
        }
        else
        {
            newCell.job = [self.jobs objectAtIndex:indexPath.row];
        }
        [newCell drawCell];

    }
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
    StandardJob *job = nil;
    
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
