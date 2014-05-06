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
<<<<<<< HEAD
#import "MiddleJob.h"
=======
#import "Constants.h"
>>>>>>> sazonova

@interface VacanciesViewController()<UISearchDisplayDelegate, UISearchBarDelegate>
{
    UISearchDisplayController * searchDisplayController;
    float tableviewOffset;
    BOOL isSearching;
}

@property(nonatomic, strong)NSArray * jobs;
<<<<<<< HEAD
<<<<<<< HEAD
@property(nonatomic, strong)NSArray * middleJobs;
=======
>>>>>>> sazonova
@property(nonatomic, strong)NSArray * searchResults;
=======
@property(nonatomic, strong)NSMutableArray * searchResults;
>>>>>>> sazonova
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
<<<<<<< HEAD
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
=======
        
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
>>>>>>> sazonova
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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Вакансии" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (IBAction)goToSearch:(id)sender
{
<<<<<<< HEAD
<<<<<<< HEAD
    StandardJobCell *cell;
    cell = [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:premiumJobIdentifier];
    [self configureCell:cell inTableView:self.tableView AtIndexPath:indexPath];
    return cell.totalHeight;
=======
    float statusbarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    if ([notification.name isEqualToString:UIKeyboardWillShowNotification])
    {
        [UIView animateWithDuration:0.25 animations:^{
            searchBar.frame =  CGRectMake(0,
                                          statusbarHeight,
                                          searchBar.bounds.size.width,
                                          searchBar.bounds.size.height
                                          );
            self.tableView.frame = CGRectMake(0, statusbarHeight + VCRowHeight + 4, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
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
            self.tableView.frame = CGRectMake(0, navBarHeight + VCRowHeight + 4, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
        }];
    }
    
=======
    [self.searchBar becomeFirstResponder];
>>>>>>> sazonova
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self rowHeightinTableView:tableView ForIndexPath:indexPath];
>>>>>>> sazonova
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
<<<<<<< HEAD
    StandardJobCell *cell;
    if (indexPath.row < 7)
=======
    UITableViewCell *cell;
    cell = [self configureCell:cell inTableView:tableView AtIndexPath:indexPath];
    return cell;
}

-(UITableViewCell *)configureCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath
{
    Job * currentJob;
    if (tableView == self.searchDisplayController.searchResultsTableView)
>>>>>>> sazonova
    {
        currentJob = self.searchResults[indexPath.row];
    }
    else
    {
        currentJob = self.jobs[indexPath.row];
    }
<<<<<<< HEAD
    [self configureCell:cell inTableView:tableView AtIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(StandardJobCell *)cell inTableView:(UITableView *)tableView AtIndexPath:(NSIndexPath *)indexPath
=======
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
>>>>>>> sazonova
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
<<<<<<< HEAD
    [cell drawCell];
=======
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
>>>>>>> sazonova
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
<<<<<<< HEAD
    Job *job = nil;
    
=======
    DetailVacanciesViewController * detailVacancyViewController = [[DetailVacanciesViewController alloc] init];
    Job * job;
>>>>>>> sazonova
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
