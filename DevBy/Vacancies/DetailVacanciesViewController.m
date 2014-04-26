//
//  DetailVacanciesViewController.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailVacanciesViewController.h"

static float navBarHeight = 64.0f;

@interface DetailVacanciesViewController ()
{
    float totalHeight;
    float offset;
    CGRect textViewFrame;
}

@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)UITextView * textView;
@property(nonatomic, strong)NSString * jobDescription;

@end

@implementation DetailVacanciesViewController

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
        textViewFrame = CGRectMake(offset * 0.8, totalHeight + offset/3, self.view.bounds.size.width - 2 * offset, self.view.bounds.size.height/5);
        _textView = [[UITextView alloc] initWithFrame:textViewFrame];
        _textView.userInteractionEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:14];
    }
    return _textView;
}

-(NSString *)jobDescription
{
    if (!_jobDescription)
    {
        _jobDescription = @"Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествия";
    }
    return _jobDescription;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    offset = 20.0f;
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    if (navObjectsHeight == 0)
    {
        navObjectsHeight = navBarHeight;
    }
    totalHeight = offset + navObjectsHeight;
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect nameLabelFrame = CGRectMake(offset, totalHeight, self.view.bounds.size.width - offset * 2, 0);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:21];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.jobTitle;
    [nameLabel sizeToFit];
    [self.scrollView addSubview:nameLabel];
    totalHeight += nameLabel.bounds.size.height + offset/4;
    
    CGRect dateLabelFrame = CGRectMake(offset, totalHeight, self.view.bounds.size.width - offset * 2, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:15];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.numberOfLines = 0;
    dateLabel.text = @"Epam";
    [dateLabel sizeToFit];
    [self.scrollView addSubview:dateLabel];
    totalHeight += dateLabel.bounds.size.height + offset/1.5;
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Описание", @"Требования", @"Контакты", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(20, totalHeight, self.view.bounds.size.width - 2 * offset, 30);
    totalHeight += segmentedControl.bounds.size.height;
    [segmentedControl addTarget:self action:@selector(touchSegmentedControl:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self addDescription];
    [self.scrollView addSubview:segmentedControl];
    [self.view addSubview:self.scrollView];
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
        [self addContacts];
    }
    
}

-(void)addDescription
{
    self.textView.frame = textViewFrame;
    self.textView.text = self.jobDescription;
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addPrice
{
    self.textView.frame = textViewFrame;
    self.textView.text = @"Технологии: XML/XSLT, .NET (C#; ASP.NET), sql, HTML/DHTML \nИностранные языки: Английский — Intermediate \nОбразование: Не имеет значения";
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addContacts
{
    self.textView.frame = textViewFrame;
    self.textView.text = @"Эл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com";
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

@end
