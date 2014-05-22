//
//  DetailEventViewController.m
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailEventViewController.h"
#import "Constants.h"

@interface DetailEventViewController ()
{
    float totalHeight;
    CGRect textViewFrame;
    EventsParser *eventsParser;
    EventDetail *eventDetail;
    
    NSString *postfix;
}

@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)UITextView * textView;

@end

@implementation DetailEventViewController

- (id)initWithPostfix:(NSString *)eventsPostfix
{
    self = [super init];
    if(self)
    {
        postfix = eventsPostfix;
    }
    return self;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _scrollView;
}

-(UITextView *)textView
{
    if (!_textView)
    {
        textViewFrame = CGRectMake(offset * 0.3, totalHeight + offset/3, self.view.bounds.size.width - 0.6 * offset, self.view.bounds.size.height/5);
        _textView = [[UITextView alloc] initWithFrame:textViewFrame];
        _textView.userInteractionEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:14];
    }
    return _textView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    eventsParser = [[EventsParser alloc] init];
    eventDetail = [eventsParser getDetailInfoOf:postfix/*@"lazertag-na-it-cup-cobiraem-sportsmenov-v-it-boy"*/];
    
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    totalHeight = offset*0.4 + navObjectsHeight;
    self.view.backgroundColor = [UIColor whiteColor];
  
    CGRect nameLabelFrame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, self.view.bounds.size.height/5);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:21];
    nameLabel.numberOfLines = 0;
    nameLabel.text = eventDetail.title;

    if ([eventDetail.title length] > DEMaxCharsForBigFont)
    {
        nameLabel.adjustsFontSizeToFitWidth = YES;
    }
    else
    {
        [nameLabel sizeToFit];
    }
    [self.scrollView addSubview:nameLabel];
    totalHeight += nameLabel.bounds.size.height + offset/4;
    
    CGRect dateLabelFrame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:14];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.numberOfLines = 0;
    dateLabel.text = eventDetail.time;
    [dateLabel sizeToFit];
    [self.scrollView addSubview:dateLabel];
    totalHeight += dateLabel.bounds.size.height + offset/1.5;
    
    CGRect imageFrame = CGRectMake(offset, totalHeight + 2, 15, 19);
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"man"]];
    image.frame = imageFrame;
    [self.scrollView addSubview:image];
    
    CGRect countLabelFrame = CGRectMake(1.3 * offset + image.bounds.size.width, totalHeight, self.view.bounds.size.width/3, 0);
    UILabel * countLabel = [[UILabel alloc] initWithFrame:countLabelFrame];
    countLabel.font = [UIFont systemFontOfSize:20];
    countLabel.numberOfLines = 0;
    countLabel.text = [[NSString alloc] initWithFormat:@"%d", eventDetail.listenersCount];
    [countLabel sizeToFit];
    [self.scrollView addSubview:countLabel];
    
    totalHeight += image.bounds.size.height + offset/1.5;
    NSArray *itemArray = [NSArray arrayWithObjects: @"Описание", @"Цена", @"Адрес", @"Контакты", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 30);
    totalHeight += segmentedControl.bounds.size.height;
    [segmentedControl addTarget:self action:@selector(touchSegmentedControl:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self addDescription];
    [self.scrollView addSubview:segmentedControl];
    [self.view addSubview:self.scrollView];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(void)touchSegmentedControl:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        [self addDescription];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {
        [self addPrice];
    }
    else if(segmentedControl.selectedSegmentIndex == 2)
    {
        [self addAddress];
    }
    else if(segmentedControl.selectedSegmentIndex == 3)
    {
        [self addContacts];
    }

    
}

-(void)addDescription
{
    self.textView.frame = textViewFrame;
    self.textView.text = eventDetail.description;
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addPrice
{
    self.textView.frame = textViewFrame;
    self.textView.text = eventDetail.price;
    [self.textView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addAddress
{
    self.textView.frame = textViewFrame;
    self.textView.text = eventDetail.address;
    [self.textView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addContacts
{
    self.textView.frame = textViewFrame;
    NSMutableString *contacts = [[NSMutableString alloc] init];
    if(eventDetail.sponsorInfo)
        [contacts appendFormat:@"Спонсор: %@\n", eventDetail.sponsorInfo];
    if(eventDetail.email)
        [contacts appendFormat:@"Эл.почта: %@\n", eventDetail.email];
    if(eventDetail.siteAddress)
        [contacts appendFormat:@"Сайт: %@\n", eventDetail.siteAddress];
    if(eventDetail.phoneNumber)
        [contacts appendFormat:@"Телефон: %@\n", eventDetail.phoneNumber];
    self.textView.text = contacts;

    [self.textView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

@end
