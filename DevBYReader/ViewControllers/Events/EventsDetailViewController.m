//
//  EventsDetailViewController.m
//  DevBYReader
//
//  Created by Admin on 4/23/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventsDetailViewController.h"

@interface EventsDetailViewController ()
{
    NSInteger eventId;
    EventRepository *eventRepository;
    UIScrollView *scrollView;    
}
- (void)showEventWithId:(NSInteger)eventId_;

@end

@implementation EventsDetailViewController

- (id)initWithEventId:(NSInteger)eventId_
{
    self = [super init];
    if (self) {
        eventId = eventId_;
        eventRepository = [[EventRepository alloc] init];
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self showEventWithId:eventId];
    }
    return self;
}

- (void)showEventWithId:(NSInteger)eventId_
{
    EventDetailModel *model = [eventRepository getEventDetailModel:eventId_];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = model.title;
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:FONT_EXTRABIG_SIZE];
    CGSize titleSize = [titleLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH - 2 * MARGIN_SMALL, NSIntegerMax)];
    titleLabel.frame = CGRectMake(MARGIN_BIG, 50 + MARGIN_BIG, titleSize.width, titleSize.height);
    titleLabel.backgroundColor = [UIColor orangeColor];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = model.time;
    timeLabel.numberOfLines = 0;
    timeLabel.font = [UIFont systemFontOfSize:FONT_MEDIUM_SIZE];
    CGSize timeSize = [timeLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH - 2 * MARGIN_SMALL, NSIntegerMax)];
    timeLabel.frame = CGRectMake(MARGIN_BIG, titleLabel.frame.origin.y + titleLabel.frame.size.height + MARGIN_MEDUIM, timeSize.width, timeSize.height);
    timeLabel.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:titleLabel];
    [self.view addSubview:timeLabel];
}

@end
