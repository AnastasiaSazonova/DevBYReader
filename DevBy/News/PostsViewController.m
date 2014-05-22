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


@interface PostsViewController () <SlideViewDelegate, HTMLParserDelegate>
{
    NSMutableArray * _posts;
    float mainCellHeight;
    NSMutableArray* cellsArray;
    NSMutableDictionary* cellsDictionary;
    NSString* urlToLoad;
}

@end

@implementation PostsViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        [self startLoadAndParseContentByUrl:NEWS_URL];
    }
    return self;
}

- (void) startLoadAndParseContentByUrl:(NSString*)url
{
    urlToLoad = url;
    HTMLParser* parse = [HTMLParser sharedInstance];
    [parse startParseFromUrl:url andXPath:NEWS_XPATH];
    parse.delegate = self;
}

-(void)parseData:(NSDictionary *)dataDictionary WithUrl:(NSString *)url andXPath:(NSString *)xpath
{
    if([url isEqualToString:urlToLoad] && [xpath isEqualToString:NEWS_XPATH])
    {
        NewsParse *parser = [[NewsParse alloc]init];
        [self fillCellArrayWithDataArray:[parser getDataFromDictionary:dataDictionary]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    cellsArray = [NSMutableArray array];
    cellsDictionary = [NSMutableDictionary dictionary];
    mainCellHeight = self.view.bounds.size.height*0.4 - halfOffset/2;
}

- (void)fillCellArrayWithDataArray:(NSArray*)dataArray
{
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if(![obj isKindOfClass:NewsElement.class])
            return ;
        
        NewsElement* element = (NewsElement*)obj;
        
        if(idx == 0)
            [cellsArray addObject:[self createMainCellWithElement:element]];
        else
            [cellsArray addObject:[self createArticleCellWithElement:element]];
    }];

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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SlideViewController* slideViewController = [[SlideViewController alloc]initWithPageIndex:indexPath.row];
    slideViewController.delegate = self;
    [self.navigationController pushViewController:slideViewController animated:YES];
}

@end
