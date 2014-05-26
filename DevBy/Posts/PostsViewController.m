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
#import "HTMLParser.h"
#import "NewsParse.h"
#import "NewsElement.h"

#define NEXT_PAGE_URL @"http://dev.by/?page="


@interface PostsViewController () <SlideViewDelegate, HTMLParserDelegate>
{
    float mainCellHeight;
    NSMutableArray* cellsArray;
    NSString* urlToLoad;
    int currentPage;
    
    SlideViewController* slideViewController;
}

@end

@implementation PostsViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        [self startLoadAndParseContentByUrl:POSTS_URL];
    }
    return self;
}

- (void) startLoadAndParseContentByUrl:(NSString*)url
{
    urlToLoad = url;
    HTMLParser* parse = [HTMLParser sharedInstance];
    [parse startParseFromUrl:url andXPath:POSTS_XPATH];
    parse.delegate = self;
}

-(void)parseData:(NSDictionary *)dataDictionary WithUrl:(NSString *)url andXPath:(NSString *)xpath
{
    [self.refreshControl endRefreshing];
    
    if([url isEqualToString:urlToLoad] && [xpath isEqualToString:POSTS_XPATH] && [url isEqualToString:POSTS_URL] && currentPage != 1 && dataDictionary)
    {
        NewsParse *parser = [[NewsParse alloc]init];
        [self insertNewData:[parser getDataFromDictionary:dataDictionary]];
        return;
    }
    if([url isEqualToString:urlToLoad] && [xpath isEqualToString:POSTS_XPATH] && dataDictionary)
    {
        NewsParse *parser = [[NewsParse alloc]init];
        [self fillCellArrayWithDataArray:[parser getDataFromDictionary:dataDictionary]];
        currentPage++;
        return;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger totalRow = [tableView numberOfRowsInSection:indexPath.section];
    if(indexPath.row == totalRow -2)
    {
        urlToLoad = [NSString stringWithFormat:@"%@%d",NEXT_PAGE_URL,currentPage];
        [self startLoadAndParseContentByUrl:urlToLoad];
    }
}

- (void)checkNewData
{
    [self startLoadAndParseContentByUrl:POSTS_URL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    currentPage = 1;
    cellsArray = [NSMutableArray array];
    mainCellHeight = self.view.bounds.size.height*0.4 - halfOffset/2;
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(checkNewData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = self.refreshControl;
}

- (void)insertNewData:(NSArray*)dataArray
{
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if(![obj isKindOfClass:NewsElement.class])
            return ;
        
        NewsElement* element = (NewsElement*)obj;
        if(![element.url isEqualToString:((MainArticleCell*)[cellsArray objectAtIndex:idx]).articleUrl])
        {
            [cellsArray insertObject:[self createMainCellWithElement:element] atIndex:idx];
        }
    }];
    [self.tableView reloadData];
    if(slideViewController)
        [slideViewController reloadContent];
}

- (void)fillCellArrayWithDataArray:(NSArray*)dataArray
{
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if(![obj isKindOfClass:NewsElement.class])
            return ;
        
        NewsElement* element = (NewsElement*)obj;
        
        if(currentPage == 1 && idx == 0)
        {
            [cellsArray addObject:[self createMainCellWithElement:element]];
            return;
        }
        [cellsArray addObject:[self createArticleCellWithElement:element]];
    }];
    
    [self.tableView reloadData];
    if(slideViewController)
        [slideViewController reloadContent];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (MainArticleCell*) createMainCellWithElement:(NewsElement*)element
{
    MainArticleCell * cell = [[MainArticleCell alloc] init];
    cell.title = element.title;
    cell.imageUrl = element.image;
    cell.articleUrl = element.url;
    cell.height = mainCellHeight;
    [cell drawCell];
    
    return cell;
}

- (ArticleCell*)createArticleCellWithElement:(NewsElement*)element
{
    ArticleCell * cell = [[ArticleCell alloc] init];
    cell.title = element.title;
    cell.date = element.time;
    cell.imageUrl = element.image;
    cell.articleUrl = element.url;
    [cell drawCell];
    return cell;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cellsArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return mainCellHeight;
    }
    else
    {
        return ((ArticleCell*) [cellsArray objectAtIndex:indexPath.row]).height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [cellsArray objectAtIndex:indexPath.row];
}

-(NSString *)urlOfCurrentArticle:(int)index
{
    NSString* url;
    if(index == 0)
    {
        url = ((MainArticleCell*)[cellsArray objectAtIndex:index]).articleUrl;
        
    }else
    {
        url = ((ArticleCell*)[cellsArray objectAtIndex:index]).articleUrl;
    }
    return url;
}

-(NSInteger)countForPages
{
    return [cellsArray count];
}

-(void)loadContentType:(NSString *)identifier
{
    if([identifier isEqualToString:MOVE_RIGHT])
    {
        [self startLoadAndParseContentByUrl:NEWS_URL];
    }
    if([identifier isEqualToString:MOVE_LEFT])
    {
        urlToLoad = [NSString stringWithFormat:@"%@%d",NEXT_PAGE_URL,currentPage];
        [self startLoadAndParseContentByUrl:urlToLoad];
    }
}

-(void)setSlideSystemToNil
{
    slideViewController = nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    slideViewController = [[SlideViewController alloc]initWithPageIndex:indexPath.row];
    slideViewController.delegate = self;
    [self.navigationController pushViewController:slideViewController animated:YES];
}

@end
