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
#import "SlideViewController.h"
#import "Post.h"
#import "PostDetail.h"
#import "PostsParser.h"

@interface PostsViewController () <SlideViewDelegate>
{
    NSMutableArray * _posts;
    float mainCellHeight;
    float articleCellHeight;
    PostsParser *postsParser;
}

@end

@implementation PostsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    postsParser = [[PostsParser alloc] init];
    
    mainCellHeight = self.view.bounds.size.height*0.4 - halfOffset/2;
    articleCellHeight = (self.view.bounds.size.height - mainCellHeight - navBarHeight)/3 + 7;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[self imageWithImage:[UIImage imageNamed:@"devLogo"] scaledToSize:CGSizeMake(100, 35)]];
    _posts = [postsParser getPosts];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Новости" style:UIBarButtonItemStylePlain target:nil action:nil];
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
            articleCell.title = [(Post *)_posts[indexPath.row] title];
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
            articleCell.title = [(Post *)_posts[indexPath.row] title];
            articleCell.date = @"25 апреля в 08:26";
            articleCell.image = [UIImage imageNamed:@"devImage3"];
            articleCell.height = articleCellHeight;
            [articleCell drawCell];
        }
    }
    
    return cell;
}

-(NSInteger)countForPages
{
    return [_posts count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    SlideViewController* slideViewController = [[SlideViewController alloc]initWithIndex:indexPath.row];
    slideViewController.delegate = self;
    [self.navigationController pushViewController:slideViewController animated:YES];

}

@end
