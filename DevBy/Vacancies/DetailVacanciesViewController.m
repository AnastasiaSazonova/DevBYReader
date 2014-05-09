//
//  DetailVacanciesViewController.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailVacanciesViewController.h"
#import "Constants.h"

@interface DetailVacanciesViewController () <UIScrollViewDelegate>
{
    float totalHeight;
    CGRect textViewFrame;
    UIView* backView;
    
    int previousSelectedSegment;
    UISegmentedControl *segmentControl;
    UIView* moveView;
}

@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)UITextView * textView;
@property(nonatomic, strong)NSString * jobDescription;

@property(nonatomic, strong)UITextView* descrTextView;
@property(nonatomic, strong)UITextView* requirementTextView;
@property(nonatomic, strong)UITextView* contactsTextView;

@end

@implementation DetailVacanciesViewController

@synthesize descrTextView;
@synthesize requirementTextView;
@synthesize contactsTextView;


-(UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _scrollView;
}

- (UITextView *)textViewInit
{
    textViewFrame = CGRectMake(offset * 0.3, totalHeight + offset/3, self.view.bounds.size.width - 0.6 * offset, self.view.bounds.size.height/5);
   UITextView* textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.userInteractionEnabled = NO;
    textView.font = [UIFont systemFontOfSize:14];
    
    [textView setBackgroundColor:[UIColor clearColor]];

    return textView;
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
    segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentControl.frame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 30);
    totalHeight += segmentControl.bounds.size.height;
    [segmentControl addTarget:self action:@selector(touchSegmentedControl:) forControlEvents: UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    previousSelectedSegment = 0;
    [self.scrollView addSubview:segmentControl];
    
    descrTextView = [self textViewInit];
    [self addTextContent:self.jobDescription toTextView:descrTextView];
    
    backView = [[UIView alloc]initWithFrame:descrTextView.frame];
    descrTextView.frame = backView.bounds;
    [backView addSubview:descrTextView];
    moveView = descrTextView;
    
    [self.scrollView addSubview:backView];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + descrTextView.frame.size.height);
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeRight setDirection:(UISwipeGestureRecognizerDirectionRight )];
    [backView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeLeft setDirection:(UISwipeGestureRecognizerDirectionLeft )];
    [backView addGestureRecognizer:swipeLeft];

}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight && previousSelectedSegment == 1)
    {
        if(!descrTextView)
        {
            descrTextView = [self textViewInit];
            [self addTextContent: self.jobDescription toTextView:descrTextView];
        }
        [self moveTextView: descrTextView toDirection:MOVE_RIGHT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment =  0;
        return;
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft && previousSelectedSegment == 0)
    {
        if(!requirementTextView)
        {
            requirementTextView = [self textViewInit];
            [self addTextContent: @"BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLAЭл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com       Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu"  toTextView:requirementTextView];

        }
        [self moveTextView: requirementTextView toDirection:MOVE_LEFT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment = 1;
        return;
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight && previousSelectedSegment == 2)
    {
        if(!requirementTextView)
        {
            requirementTextView = [self textViewInit];
            [self addTextContent: @"BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLAЭл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com       Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu"  toTextView:requirementTextView];
            
        }
       [self moveTextView: requirementTextView toDirection:MOVE_RIGHT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment = 1;
        return;
     }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft && previousSelectedSegment == 1)
    {
        if(!contactsTextView)
        {
            contactsTextView = [self textViewInit];
            [self addTextContent: @"Эл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com " toTextView:contactsTextView];
        }
        [self moveTextView: contactsTextView toDirection:MOVE_LEFT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment = 2;
        return;
    }
}

-(void)touchSegmentedControl:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        if(!descrTextView)
        {
            descrTextView = [self textViewInit];
            [self addTextContent: self.jobDescription toTextView:descrTextView];
        }
        [self moveTextView: descrTextView toDirection:MOVE_RIGHT];
    }
    else if (segmentedControl.selectedSegmentIndex == 1 && previousSelectedSegment == 2)
    {
        if(!requirementTextView)
        {
            requirementTextView = [self textViewInit];
            [self addTextContent: @"BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLAЭл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com       Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu"  toTextView:requirementTextView];
        }
        [self moveTextView:requirementTextView toDirection:MOVE_RIGHT];
    }
    else if (segmentedControl.selectedSegmentIndex == 1 && previousSelectedSegment == 0)
    {
        if(!requirementTextView)
        {
            requirementTextView = [self textViewInit];
            [self addTextContent: @"BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLAЭл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com       Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu"  toTextView:requirementTextView];
        }
        [self moveTextView: requirementTextView toDirection:MOVE_LEFT];
    }
    else if (segmentedControl.selectedSegmentIndex == 2)
    {
        if(!contactsTextView)
        {
            contactsTextView = [self textViewInit];
            [self addTextContent: @"Эл. почта: akrasouskaya@viacode.com \nСайт: www.viacode.com " toTextView:contactsTextView];
        }
        [self moveTextView: contactsTextView toDirection:MOVE_LEFT];
    }
    previousSelectedSegment = segmentedControl.selectedSegmentIndex;
}

- (void)moveTextView:(UITextView*)textView toDirection:(NSString*)direction
{

    if ([direction isEqualToString:MOVE_LEFT])
        textView.frame = CGRectMake(backView.bounds.origin.x + backView.bounds.size.width, backView.bounds.origin.y,textView.frame.size.width, textView.frame.size.height);
    else
        textView.frame = CGRectMake(backView.bounds.origin.x - backView.bounds.size.width, backView.bounds.origin.y,textView.frame.size.width, textView.frame.size.height);
    
    [backView addSubview:textView];
    
    [UIView animateWithDuration:.23 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        if ([direction isEqualToString:MOVE_LEFT])
            moveView.frame = CGRectMake(backView.bounds.origin.x - backView.bounds.size.width, backView.bounds.origin.y, backView.bounds.size.width, backView.bounds.size.height);
        else
            moveView.frame = CGRectMake(backView.bounds.origin.x + backView.bounds.size.width, backView.bounds.origin.y, backView.bounds.size.width, backView.bounds.size.height);
        textView.frame = CGRectMake(backView.bounds.origin.x, backView.bounds.origin.y, textView.bounds.size.width, textView.bounds.size.height);
    } completion:^(BOOL finished) {
        if(finished)
        {
            [moveView removeFromSuperview];
            moveView = textView;
            if(self.view.frame.size.height - totalHeight <= textView.frame.size.height)
            {
                backView.frame = CGRectMake(backView.frame.origin.x, backView.frame.origin.y, backView.frame.size.width, textView.bounds.size.height);
                [self.scrollView setContentOffset:CGPointZero animated:YES];
            }
            else
                backView.frame = CGRectMake(backView.frame.origin.x, backView.frame.origin.y, backView.frame.size.width, self.view.frame.size.height - totalHeight);
        }
    }];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + textView.frame.size.height);
}

-(void)addTextContent:(NSString*) content toTextView: (UITextView*) textView
{
    textView.text = content;
    CGFloat height = [self textViewHeightForAttributedText:textView.attributedText andWidth:textViewFrame.size.width];
    textView.frame = CGRectMake(textViewFrame.origin.x, textViewFrame.origin.y, textViewFrame.size.width, height);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + textView.frame.size.height);
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

@end
