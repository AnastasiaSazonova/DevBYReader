//
//  CommentsTableView.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "CommentsTableView.h"

@interface CommentsTableView()<UITableViewDelegate, UITableViewDataSource>

//@property(nonatomic, assign, readwrite)float tableHeight;

@end

@implementation CommentsTableView

- (id)initWithFrame:(CGRect)frame comments:(NSArray *)comments
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.comments = comments;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.comments count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float maxCharsPerRow = 30.0f;
    float rowHeight = 40.0f;
    int cellContentLength = [self.comments[indexPath.row] length];
    if (cellContentLength > maxCharsPerRow)
    {
        rowHeight *= cellContentLength/maxCharsPerRow;
        self.tableHeight += rowHeight;
        return rowHeight;
    }
    self.tableHeight += rowHeight;
    return rowHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.comments[indexPath.row];
    return cell;
}

@end
