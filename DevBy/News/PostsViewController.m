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


@interface PostsViewController () <SlideViewDelegate, HTMLParserDelegate>
{
    NSMutableArray * _posts;
    float mainCellHeight;
    float articleCellHeight;
    NSMutableArray* cellsArray;
}

@end

@implementation PostsViewController

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
        NSLog(@"%@",dataDictionary);
    }
}



-(void)workWithTitle:(NSDictionary*)data
{
    NSLog(@"%@",data);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    cellsArray = [NSMutableArray array];
    mainCellHeight = self.view.bounds.size.height*0.4 - halfOffset/2;
    articleCellHeight = (self.view.bounds.size.height - mainCellHeight - navBarHeight)/3 + 7;
    _posts = [[NSMutableArray alloc] initWithArray:@[@"Full-stack разработчики: Программисты, понимающие весь стек, обычно создают более качественные приложения.", @"Heartbleed .", @"Злой гений создал гибрид '2048' и 'Flappy Bird' на погибель вашей продуктивности.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies.", @"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companiesdufhvuidshviufdhvuihadsioufvhaiusdhviuasdhviuoadshiuvhadsiuvhiuasdhviuadshviuhasivuhsadiuvhisad."]];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Новости" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self fillCellArray];
}

- (void)fillCellArray
{
    [_posts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(idx == 0)
            [cellsArray addObject:[self createMainCellWithTitle:(NSString*)obj image:[UIImage imageNamed:@"devImage3"]]];
        else
            [cellsArray addObject:[self createArticleCellWithTitle:(NSString*) obj date:@"25 апреля в 08:26" image:[UIImage imageNamed:@"devImage3"]]];
    }];

}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (MainArticleCell*) createMainCellWithTitle:(NSString *)title image:(UIImage*)image
{
    MainArticleCell * cell = [[MainArticleCell alloc] init];
    cell.title = title;
    cell.image = image;
    cell.height = mainCellHeight;
    [cell drawCell];
    return cell;
}

- (ArticleCell*)createArticleCellWithTitle:(NSString *)title date:(NSString*) date image:(UIImage*)image
{
    ArticleCell * cell = [[ArticleCell alloc] init];
    cell.title = title;
    cell.date = date;
    cell.image = image;
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
//    if (indexPath.row == 0)
//    {
//        return mainCellHeight;
//    }
//    else
//    {
//        return ((ArticleCell*) [cellsArray objectAtIndex:indexPath.row]).height;
//    }
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
    SlideViewController* slideViewController = [[SlideViewController alloc]initWithIndex:indexPath.row];
    slideViewController.delegate = self;
    [self.navigationController pushViewController:slideViewController animated:YES];
}

@end
