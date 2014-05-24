//
//  PostsTableViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "NewsViewController.h"
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
#import "DetailNewsViewController.h"


@interface  NewsViewController() <SlideViewDelegate, HTMLParserDelegate>
{
    NSMutableArray * _posts;
    float mainCellHeight;
    NSMutableArray* cellsArray;
    NSMutableDictionary* cellsDictionary;
    UIActivityIndicatorView * activityIndicator;
}

@end

@implementation NewsViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        HTMLParser* parse = [HTMLParser sharedInstance];
        [parse startParseFromUrl:NEWS_URL andXPath:NEWS_XPATH];
        parse.delegate = self;
    }
    return self;
}

-(void)parseData:(NSDictionary *)dataDictionary WithUrl:(NSString *)url andXPath:(NSString *)xpath
{
    if([url isEqualToString:NEWS_URL] && [xpath isEqualToString:NEWS_XPATH])
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
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2 - 50);
    CGAffineTransform transform = CGAffineTransformMakeScale(1.5f, 1.5f);
    activityIndicator.transform = transform;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
}

- (void)fillCellArrayWithDataArray:(NSArray*)dataArray
{
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if(![obj isKindOfClass:NewsElement.class])
            return ;
        
        NewsElement* element = (NewsElement*)obj;
        
        [cellsArray addObject:[self createArticleCellWithElement:element]];
    }];
    [activityIndicator stopAnimating];
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

-(NSString *)trimLeadingOffset:(NSString *)tempStr
{
    tempStr = [tempStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return tempStr;
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
    return ((ArticleCell*) [cellsArray objectAtIndex:indexPath.row]).height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [cellsArray objectAtIndex:indexPath.row];
}

-(NSInteger)countForPages
{
    return [_posts count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    SlideViewController* slideViewController = [[SlideViewController alloc]initWithPageIndex:indexPath.row];
//    slideViewController.delegate = self;
//    [self.navigationController pushViewController:slideViewController animated:YES];
    ArticleCell * currentCell = cellsArray[indexPath.row];
    DetailNewsViewController * detailNewsViewController = [[DetailNewsViewController alloc] initWithUrl:[NSString stringWithFormat:@"http://dev.by/%@", currentCell.articleUrl] date:currentCell.date];
    [self.navigationController pushViewController:detailNewsViewController animated:NO];
}

@end
