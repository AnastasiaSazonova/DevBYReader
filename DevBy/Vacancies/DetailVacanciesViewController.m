//
//  DetailVacanciesViewController.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailVacanciesViewController.h"
#import "Constants.h"

@interface DetailVacanciesViewController ()
{
    float totalHeight;
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
        textViewFrame = CGRectMake(offset * 0.3, totalHeight + offset/3, self.view.bounds.size.width - 0.6 * offset, self.view.bounds.size.height/5);
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
        _jobDescription = @"Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu";
    }
    return _jobDescription;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    if (navObjectsHeight == 0)
    {
        navObjectsHeight = navBarHeight;
    }
    totalHeight = offset + navObjectsHeight;
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect nameLabelFrame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 0);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:DVNamelabelFont];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.jobTitle;
    [nameLabel sizeToFit];
    [self.scrollView addSubview:nameLabel];
    totalHeight += nameLabel.bounds.size.height + offset/4;
    
    CGRect dateLabelFrame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:DVDatelabelFont];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.numberOfLines = 0;
    dateLabel.text = @"Epam";
    [dateLabel sizeToFit];
    [self.scrollView addSubview:dateLabel];
    totalHeight += dateLabel.bounds.size.height + offset/1.5;
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Описание", @"Требования", @"Контакты", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 30);
    totalHeight += segmentedControl.bounds.size.height;
    [segmentedControl addTarget:self action:@selector(touchSegmentedControl:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self.scrollView addSubview:self.textView];
    [self addTextContentToTextView:self.jobDescription];
    [self.scrollView addSubview:segmentedControl];
    [self.view addSubview:self.scrollView];
}

-(void)touchSegmentedControl:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        [self addTextContentToTextView:self.jobDescription];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {
        [self addTextContentToTextView:@"Технологии: XML/XSLT, .NET (C#; ASP.NET), sql, HTML/DHTML         Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu"];
    }
    else if(segmentedControl.selectedSegmentIndex == 2)
    {
        [self addTextContentToTextView:@"Эл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com       Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu"];
    }
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

-(void)addTextContentToTextView:(NSString*) content
{
    self.textView.text = content;
    CGFloat height = [self textViewHeightForAttributedText:self.textView.attributedText andWidth:textViewFrame.size.width];
    self.textView.frame = CGRectMake(textViewFrame.origin.x, textViewFrame.origin.y, textViewFrame.size.width, height);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.frame.size.height);
}

@end
