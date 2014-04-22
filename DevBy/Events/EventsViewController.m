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
        _events = [[NSMutableArray alloc] initWithArray:@[@"Как правильно составить резюме молодому специалисту",@"Апрельская MLUG 2014", @"Официальный Scrum-тренинг в Минске: Professional Scrum Master. Официальный Scrum-тренинг в Минске: Professional Scrum Master. Официальный Scrum-тренинг в Минске: Professional Scrum Master", @"Встреча сообщества разработчиков WinITby"]];
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
    return [self.events count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * reuseIdentifier = @"Cell";
    EventCell * cell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault name:self.events[indexPath.row] reuseIdentifier:reuseIdentifier];
    //float rowHeight = cell.bounds.size.height;
    return cell.totalHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * reuseIdentifier = @"Cell";
    EventCell * cell = [[EventCell alloc] initWithStyle:UITableViewCellStyleDefault name:self.events[indexPath.row] reuseIdentifier:reuseIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailEventViewController * detailEventViewController = [[DetailEventViewController alloc] init];
    detailEventViewController.eventsName = self.events[indexPath.row];
    [self.navigationController pushViewController:detailEventViewController animated:YES];
}


@end
