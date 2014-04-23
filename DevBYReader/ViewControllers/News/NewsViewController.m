//
//  NewsViewController.m
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()
{
    NewsRepository *newsRepository;
    NSArray *newsList;
}
@end

@implementation NewsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.title = @"Новости";
        newsRepository = [[NewsRepository alloc] init];
        newsList = [newsRepository getNewsList];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    ImageHelper *imgHelper = [[ImageHelper alloc] init];
    
    NewsTableViewCell *cell = (NewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    //UIView* view = [[UIView alloc] initWithFrame:cell.frame];
    //[cell addSubview:view];
    
    NewsModel *currentNews = [newsList objectAtIndex:indexPath.row];
    cell.titleLabel.text = currentNews.title;
    cell.timeLabel.text = currentNews.time;
    cell.thumbnailImageView.image = [imgHelper getRectImageFrom:[UIImage imageNamed:currentNews.imageName]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger newsId = [[newsList objectAtIndex:indexPath.row] newsId];
    [self.navigationController pushViewController:[[NewsDetailViewController alloc] initWithNewsId:newsId] animated:YES];
}

@end
