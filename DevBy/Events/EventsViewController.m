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

NSString * eventCellReuseIdentifier = @"EventCell";

@interface EventsViewController()

@property(nonatomic, strong)NSMutableArray * events;

@end

@implementation EventsViewController
{
    EventCell* cellTrial;
    EventsParser *eventsParser;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[EventCell class] forCellReuseIdentifier:eventCellReuseIdentifier];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"События" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    eventsParser = [[EventsParser alloc] init];
    self.events = [eventsParser getEvents];     //must async!!!
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.events count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventCell * prototypeCell = [[EventCell alloc] init];
    [self configureCell:prototypeCell forRowAtIndexPath:indexPath];
    return prototypeCell.totalHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[EventCell alloc] init];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[EventCell class]])
    {
        Event *event = self.events[indexPath.row];
        EventCell *textCell = (EventCell *)cell;
        textCell.title = event.title;
        textCell.description = event.description;
        textCell.day = event.day;
        textCell.month = event.month;
        textCell.dayOfWeek = event.dayOfWeek;
        
        [textCell drawCell];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailEventViewController * detailEventViewController = [[DetailEventViewController alloc] initWithPostfix:[self.events[indexPath.row] link]];
    [self.navigationController pushViewController:detailEventViewController animated:YES];
}


@end
