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
    EventDetailModel *model;
    UITextView *textView;
    CGRect contentFrame;
    UISegmentedControl *segmentedControl;
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
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self showEventWithId:eventId];
    }
    return self;
}

- (void)showEventWithId:(NSInteger)eventId_
{
    model = [eventRepository getEventDetailModel:eventId_];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = model.title;
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:FONT_EXTRABIG_SIZE];
    CGSize titleSize = [titleLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH - 2 * MARGIN_SMALL, NSIntegerMax)];
    titleLabel.frame = CGRectMake(MARGIN_BIG, 50 + MARGIN_BIG, titleSize.width, titleSize.height);
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = model.time;
    timeLabel.numberOfLines = 0;
    timeLabel.font = [UIFont systemFontOfSize:FONT_MEDIUM_SIZE];
    CGSize timeSize = [timeLabel sizeThatFits:CGSizeMake(CONTENT_WIDTH - 2 * MARGIN_SMALL, NSIntegerMax)];
    timeLabel.frame = CGRectMake(MARGIN_BIG, titleLabel.frame.origin.y + titleLabel.frame.size.height + MARGIN_MEDUIM, timeSize.width, timeSize.height);
    
    UIButton *commentsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    commentsButton.frame = CGRectMake(MARGIN_BIG, timeLabel.frame.origin.y + timeLabel.frame.size.height + MARGIN_SMALL, 160, 25);
    [commentsButton setTitle:[NSString stringWithFormat:@"%d комментариев", model.commentsCount] forState:UIControlStateNormal];
    [commentsButton addTarget:self action:@selector(gotoComments) forControlEvents:UIControlEventTouchUpInside];
    [[commentsButton layer] setBorderWidth:1];
    [[commentsButton layer] setCornerRadius:4];
    [[commentsButton layer] setBorderColor:[UIColor grayColor].CGColor];
    //[[[[UIApplication sharedApplication] delegate] window] tintColor];
    
    UILabel *listenersLabel = [[UILabel alloc] init];
    listenersLabel.frame = CGRectMake(commentsButton.frame.origin.x + commentsButton.frame.size.width + MARGIN_MEDUIM, commentsButton.frame.origin.y, 105, 25);
    listenersLabel.font = [UIFont systemFontOfSize:FONT_SMALL_SIZE];
    listenersLabel.text = [NSString stringWithFormat:@"Слушателей: %d", model.listenersCount];
    listenersLabel.textAlignment = NSTextAlignmentRight;
    
    NSMutableArray *segments = [NSMutableArray arrayWithObjects:@"Описание", @"Цена", nil];
    if(model.address != nil)
       [segments addObject:@"Адрес"];
    if(model.sponsorName != nil || model.sponsorInfo != nil || model.sponsorLogoAddress != nil || model.email != nil || model.siteAddress != nil || model.phoneNumber != nil)
       [segments addObject:@"Контакты"];
    
    segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    segmentedControl.frame = CGRectMake(MARGIN_BIG, commentsButton.frame.origin.y + commentsButton.frame.size.height + MARGIN_BIG, CONTENT_WIDTH - 2 * MARGIN_BIG, 30);
    [segmentedControl addTarget:self action:@selector(touchSegmentControl:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    
    contentFrame = CGRectMake(MARGIN_BIG, segmentedControl.frame.origin.y + segmentedControl.frame.size.height + MARGIN_SMALL, segmentedControl.frame.size.width, 1); ///!!!!
    textView = [[UITextView alloc] init];
    textView.font = [UIFont systemFontOfSize:FONT_MEDIUM_SIZE];
    textView.scrollEnabled = NO;
    textView.editable = NO;
    
    [scrollView addSubview:titleLabel];
    [scrollView addSubview:timeLabel];
    [scrollView addSubview:commentsButton];
    [scrollView addSubview:listenersLabel];
    [scrollView addSubview:segmentedControl];
    [scrollView addSubview:textView];
    
    [self.view addSubview:scrollView];
    
    [self showDescription];
}

- (void)touchSegmentControl:(UISegmentedControl *)segmentControl
{
    NSString *selectedSegment = [segmentedControl titleForSegmentAtIndex:segmentControl.selectedSegmentIndex];
    
    if([selectedSegment isEqualToString:@"Описание"])
        [self showDescription];
    else if ([selectedSegment isEqualToString:@"Цена"])
        [self showPrice];
    else if ([selectedSegment isEqualToString:@"Адрес"])
        [self showAddress];
    else if ([selectedSegment isEqualToString:@"Контакты"])
        [self showContacts];
}

- (void)showDescription
{
    textView.text = model.description;
    textView.frame = contentFrame;
    [textView sizeToFit];
    scrollView.contentSize = CGSizeMake(CONTENT_WIDTH, textView.frame.origin.y + textView.frame.size.height + MARGIN_MEDUIM);
}

- (void)showPrice
{
    textView.text = model.price;
    textView.frame = contentFrame;
    [textView sizeToFit];
    scrollView.contentSize = CGSizeMake(CONTENT_WIDTH, textView.frame.origin.y + textView.frame.size.height + MARGIN_MEDUIM);
}

- (void)showAddress
{
    textView.text = model.address;
    textView.frame = contentFrame;
    [textView sizeToFit];
    scrollView.contentSize = CGSizeMake(CONTENT_WIDTH, textView.frame.origin.y + textView.frame.size.height + MARGIN_MEDUIM);
}

- (void)gotoComments
{
    [self.navigationController pushViewController:[[CommentsViewController alloc] initWithEventId:eventId] animated:YES];
}

- (void)showContacts
{
    NSMutableString *result = [[NSMutableString alloc] init];
    
    if(model.sponsorName)
        [result appendFormat:@"Спонсор:%@\n", model.sponsorName];
    if(model.sponsorInfo)
        [result appendFormat:@"Информация о спонсоре:\n%@\n", model.sponsorInfo];
    if(model.email)
        [result appendFormat:@"Электронная почта:%@\n", model.email];
    if(model.siteAddress)
        [result appendFormat:@"Сайт:%@\n", model.siteAddress];
    if(model.phoneNumber)
        [result appendFormat:@"Телефон:%@\n", model.phoneNumber];
    
    if(model.sponsorLogoAddress)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"companyLogo.png"]];
        [textView addSubview:imageView];
    }
    
    textView.text = result;
    textView.frame = contentFrame;
    [textView sizeToFit];
    scrollView.contentSize = CGSizeMake(CONTENT_WIDTH, textView.frame.origin.y + textView.frame.size.height + MARGIN_MEDUIM);
}

@end
