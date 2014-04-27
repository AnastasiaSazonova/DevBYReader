//
//  PostsTableViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "PostsViewController.h"
#import "TFHpple.h"
#import "HTMLElement.h"
#import "DetailPostsViewController.h"
#import "MainArticleCell.h"
#import "ArticleCell.h"
#import "Constants.h"


@interface PostsViewController ()
{
    NSMutableArray * _posts;
    float mainCellHeight;
    float articleCellHeight;
}

@end

@implementation PostsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    mainCellHeight = self.view.bounds.size.height*0.4 - 5;
    articleCellHeight = (self.view.bounds.size.height - mainCellHeight - navBarHeight)/3 + 7;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[self imageWithImage:[UIImage imageNamed:@"devLogo"] scaledToSize:CGSizeMake(100, 35)]];
    _posts = [[NSMutableArray alloc] initWithArray:@[@"Full-stack разработчики: Программисты, понимающие весь стек, обычно создают более качественные приложения.Full-stack разработчики: Программисты, понимающие весь стек, обычно создают более качественные приложения.Full-stack разработчики: Программисты, понимающие весь стек, обычно создают более качественные приложения.Full-stack разработчики: Программисты, понимающие весь стек, обычно создают более качественные приложения.", @"Heartbleed – новое слово в маркетинге багов.", @"Злой гений создал гибрид '2048' и 'Flappy Bird' на погибель вашей продуктивности.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies награждения Belarusian IT Awards и Best IT Companies."]];
    [self.tableView reloadData];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_posts count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return mainCellHeight;
    }
    else
    {
        return articleCellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[MainArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            MainArticleCell * articleCell = (MainArticleCell *)cell;
            articleCell.title = _posts[indexPath.row];
            articleCell.image = [UIImage imageNamed:@"devImage"];
            articleCell.height = mainCellHeight;
            [articleCell drawCell];
        }
    }
    
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[ArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            ArticleCell * articleCell = (ArticleCell *)cell;
            articleCell.title = _posts[indexPath.row];
            articleCell.date = @"25 апреля в 08:26";
            articleCell.image = [UIImage imageNamed:@"devImage3"];
            articleCell.height = articleCellHeight;
            [articleCell drawCell];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPostsViewController * detailViewController = [[DetailPostsViewController alloc] init];
    detailViewController.title = _posts[indexPath.row];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath == 0)
    {
        MainArticleCell * articleCell = (MainArticleCell *)cell;
        detailViewController.image = articleCell.image;
    }
    else
    {
        ArticleCell * articleCell = (ArticleCell *)cell;
        detailViewController.image = articleCell.image;
    }
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
