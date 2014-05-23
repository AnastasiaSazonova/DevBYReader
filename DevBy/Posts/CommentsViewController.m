//
//  CommentsViewController.m
//  DevBy
//
//  Created by Anastasia on 4/12/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsViewController.h"
#import "CommentsCell.h"
#import "Constants.h"
#import "HTMLParser.h"

@interface CommentsViewController () <HTMLParserDelegate>
{
    NSString* articleCellurl;
    HTMLParser* parse;
}
@end

@implementation CommentsViewController

- (id)initWithUrl:(NSString*)url
{
    self = [super init];
    if (self) {
        articleCellurl = url;
        parse = [HTMLParser sharedInstance];
        [parse startParseFromUrl:articleCellurl andXPath:NEWS_CELL_COMENTS_XPATH];
        parse.delegate = self;
    }
    return self;
}

-(void)parseData:(NSDictionary *)dataDictionary WithUrl:(NSString *)url andXPath:(NSString *)xpath
{
    if([articleCellurl isEqualToString:url] && [xpath isEqualToString:NEWS_CELL_COMENTS_XPATH])
    {
        
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentsCell * cell = [[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
    return cell.totalHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentsCell * cell = [[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(CommentsCell *)cell inTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    cell.username = @"Username";
    cell.date = @"24 April 2014, 15:07";
    cell.comment = @"Ответ очень простой: хочу - отвечаю, не хочу - не отвечаю. Ситуация целиком и полностью зависит от мотивации работника, от того считает ли что он ответственен за результат в целом, живет ли он проектом или он просто отрабатывает определенное время за деньги. В моей карьере случалось по разному.";

    if (indexPath.row > 3)
    {
        [cell drawCellWithOffset:3];
    }
    else if (indexPath.row > 2)
    {
        [cell drawCellWithOffset:2];
    }
    else if (indexPath.row > 1)
    {
        [cell drawCellWithOffset:1];
    }
    else
    {
        [cell drawCellWithOffset:0];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (![[self.navigationController viewControllers] containsObject:self])
    {
        [parse finishParse];
    }
}

@end
