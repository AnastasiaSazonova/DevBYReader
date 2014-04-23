//
//  EventsViewController.m
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()
{
    EventRepository *eventRepository;
    NSArray *eventList;
    NSMutableArray *eventTableViewCellList;
}
@end

@implementation EventsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.title = @"События";
        eventRepository = [[EventRepository alloc] init];
        eventList = [eventRepository getEventsList];
        eventTableViewCellList = [[NSMutableArray alloc] init];
    }
    return self;}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return eventList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return [eventTableViewCellList objectAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    EventsTableViewCell *cell = (EventsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[EventsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    EventModel *currentEvent = [eventList objectAtIndex:indexPath.row];
    cell.titleLabel.text = currentEvent.title;
    cell.descriptionLabel.text = currentEvent.description;
    cell.dateLabel.text = currentEvent.date;
    cell.dateDetLabel.text = currentEvent.dateDet;
    
    [eventTableViewCellList addObject:cell];
    [cell defineRects];
    
    return [cell getHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    #warning insert conent
}


@end
