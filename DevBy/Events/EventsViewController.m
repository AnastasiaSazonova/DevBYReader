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
    [self.tableView registerClass:[EventCell class] forCellReuseIdentifier:eventCellReuseIdentifier];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangePreferredContentSize:)
                                                 name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

- (void)didChangePreferredContentSize:(NSNotification *)notification
{
    [self.tableView reloadData];
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
    EventCell * prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:eventCellReuseIdentifier];
    [self configureCell:prototypeCell forRowAtIndexPath:indexPath];
    return prototypeCell.totalHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:eventCellReuseIdentifier forIndexPath:indexPath];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[EventCell class]])
    {
        EventCell *textCell = (EventCell *)cell;
        textCell.title = self.events[indexPath.row];
        textCell.description = @"18 апреля 16:00";
        textCell.day = @"15";
        textCell.date = @"апреля";
        textCell.dayOfWeek = @"ВТ";
        [textCell drawCell];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailEventViewController * detailEventViewController = [[DetailEventViewController alloc] init];
    detailEventViewController.eventsName = self.events[indexPath.row];
    [self.navigationController pushViewController:detailEventViewController animated:YES];
}


@end
