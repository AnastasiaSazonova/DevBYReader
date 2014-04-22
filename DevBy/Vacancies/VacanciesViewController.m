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
#import "MiddleJobCellTableViewCell.h"
#import "Job.h"
#import "StandardJobCell.h"

@interface VacanciesViewController()<UISearchDisplayDelegate>
{
    NSMutableArray * searchResults;
    UISearchBar * searchBar;
    UISearchDisplayController * searchDisplayController;
    BOOL isSearching;
    float rowHeight;
    float maxCharsPerRow;
}

@property(nonatomic, strong)NSArray * jobsTitle;
@property(nonatomic, strong)NSArray * jobsDescription;

@end

@implementation VacanciesViewController

-(NSArray *)jobsTitle
{
    if (!_jobsTitle)
    {
        _jobsTitle = @[@"An Extraordinary Project for Senior JavaScript Software Engineer", @".Net разработчик со знанием немецкого языка", @"Java developer (eCommerce Hybris)", @"Senior Java Developer (Lucene)", @"Специалист по тестированию", @"Проектировщик интерфейсов", @"Java Web Application Developer"];
    }
    return _jobsTitle;
}

-(NSArray *)jobsDescription
{
    if (!_jobsDescription)
    {
        _jobsDescription = @[@"We are looking for a talented senior JavaScript programmer for developing of innovative, extraordinary software product called TRIGGRE based on the latest Microsoft technologies.", @"Портал об ИТ в Беларуси dev.by приглашает журналиста на полную занятость: Мы предлагаем: - работу в штате; - офис в центре города; - гибкий рабочий график, возможность удаленной работы; - интересную работу;", @"На серьезный проект в области автомобилестроения для одного из крупнейших производителей легковых автомобилей в Германии в связи с переводом существующей части мобильного приложения на новые технологии требуется опытный Веб-разработчик.", @"SaM Solutions search for Senior Java developer with strong experience in Apache Lucene, ideally with the knowledge of (preferably) Elasticsearch or Solr. The ideal candidate will also have: - experience with ANTLR or similar parser", @"Основной вид деятельности:  Функциональное тестирование программного обеспечения  Занесение отчётов об ошибках в баг-трекинг систему ", @"ВНИМАНИЕ!!! Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании Условия работы:     Высокая официальная зарплата", @"ВНИМАНИЕ!!! Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании"];
    }
    return _jobsDescription;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Вакансии", nil);
    rowHeight = 40;
    maxCharsPerRow = 30;
    
    searchBar = [[UISearchBar alloc] init];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    self.tableView.tableHeaderView = searchBar;
    
    searchResults = [[NSMutableArray alloc] init];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.font = [UIFont systemFontOfSize:13];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        float cellContentLength = (float)[searchResults[indexPath.row] length] + (float)[self.jobsDescription[indexPath.row] length];
//        if (cellContentLength > maxCharsPerRow)
//        {
//            return rowHeight * cellContentLength/maxCharsPerRow/2;
//        }
//    }
//    else
//    {
//        float cellContentLength = (float)[self.jobsTitle[indexPath.row] length] + (float)[self.jobsDescription[indexPath.row] length];
//        if (cellContentLength > maxCharsPerRow)
//        {
//            return rowHeight * cellContentLength/maxCharsPerRow/1.7;
//        }
//
//    }
//    return rowHeight;
    if (indexPath.row < 3)
    {
        float cellContentLength = (float)[self.jobsTitle[indexPath.row] length] + (float)[self.jobsDescription[indexPath.row] length];
        return rowHeight * cellContentLength/maxCharsPerRow/1.7;
    }
    else
        return 60;
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
        return [self.jobsTitle count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * reuseIdentifier = @"Cell";
    if (indexPath.row < 3)
    {
        StandardJobCell * cell = [[PremiumJobCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        PremiumJob * job = [[PremiumJob alloc] init];
        job.description = self.jobsDescription[indexPath.row];
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            job.title = [searchResults objectAtIndex:indexPath.row];
        }
        else
        {
            job.title = [self.jobsTitle objectAtIndex:indexPath.row];
        }
        job.companysName = @"Epam";
        [cell setJob:job];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    }
    else
    {
        MiddleJobCellTableViewCell * cell = [[MiddleJobCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        Job * job = [[Job alloc] init];
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            job.title = [searchResults objectAtIndex:indexPath.row];
        }
        else
        {
            job.title = [self.jobsTitle objectAtIndex:indexPath.row];
        }
        job.companysName = @"Epam";
        [cell setJob:job];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    }
    
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    [searchResults removeAllObjects];
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [NSMutableArray arrayWithArray:[self.jobsTitle filteredArrayUsingPredicate:resultPredicate]];
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
    DetailVacanciesViewController * detailVacanciesVC = [[DetailVacanciesViewController alloc] init];
    [self.navigationController pushViewController:detailVacanciesVC animated:YES];
}

@end
