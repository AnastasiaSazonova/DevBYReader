//
//  EventsViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventsViewController.h"
#import "EventCell.h"
#import "DetailEventViewController.h"

@interface EventsViewController()

@property(nonatomic, strong)NSMutableArray * events;

@end

@implementation EventsViewController

-(NSMutableArray *)events
{
    if (!_events)
    {
        _events = [[NSMutableArray alloc] initWithArray:@[@"Событие 1",@"Событие 2"]];
    }
    return _events;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"События", nil);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float rowHeight = 150.0f;
    return rowHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * reuseIdentifier = @"Cell";
    UITableViewCell * cell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailEventViewController * detailEventViewController = [[DetailEventViewController alloc] init];
    [self.navigationController pushViewController:detailEventViewController animated:YES];
}


@end
