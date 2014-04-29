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
}

@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)UITextView * textView;

@end

@implementation DetailEventViewController

-(NSString *)eventsName
{
    if (!_eventsName)
    {
        _eventsName = @"3х-дневный тренинг \"Продвинутый Professional Scrum Master (PSM)\"";
    }
    return _eventsName;
}

-(NSString *)eventsContacts
{
    if (!_eventsContacts)
    {
        _eventsContacts = @"Эл. почта: contact@ithouse.by \nСайт: http://ithouse.by \nТелефон: (017) 209-54-04";
    }
    return _eventsContacts;
}

-(NSString *)eventsDate
{
    if (!_eventsDate)
    {
        _eventsDate = @"Минск, 24 Апреля 14:00 - 16:00";
    }
    return _eventsDate;
}

-(NSString *)eventsDescription
{
    if (!_eventsDescription)
    {
        _eventsDescription = @"По сложившейся традиции в последнюю пятницу месяца в Минске проходит Python Meetup – неформальная встреча белорусских питонистов. Время и место встречи уже хорошо всем знакомы  – это клуб «Центр» во Дворце Республики, начало в 19.00.Программа апрельской встречи:Доклад №1. Дмитрий Овчинников, Wargaming \"Разработка мобильных приложений на Python \"О чем: 1. Python для мобильных девайсов. 2. Фреймворк Kivy. Птица или фрукт? 3. Один код на разных платформах (Не Java!!!) Доклад №2. Никита Гришко, Wargaming \"Python для ленивых или как сделать свою жизнь проще \"О чем: Рассмотрим, что в мире Python’а поможет сделать разработку проще на всех ее этапах: создание проекта, настройка окружения, отладка, тестирование, профилирование, публикация на PyPI. Доклад №3. Максим Барышников, WG \"Wargaming: тыл — фронту! \"О чем: Полагаю, что не открою секрет Полишинеля, если скажу следующее: чтобы игра стала успешной (а из успешной превратилась в легендарную), недостаточно  самой игры, сколь бы хороша она ни была. Помимо всего прочего, действительно массовой игре нужна очень развитая веб-часть. О ней и пойдет речь. Как обычно будет работать \"свободный микрофон\", а это значит, что любой желающий сможет выступить с блиц-докладом, не требующим предварительно подготовленной презентации. Главное – желание поделиться чем-то интересным и полезным.";
    }
    return _eventsDescription;
}

-(NSString *)eventsPrice
{
    if (!_eventsPrice)
    {
        _eventsPrice = @"Бесплатно";
    }
    return _eventsPrice;
}

-(NSString *)eventsAddress
{
    if (!_eventsAddress)
    {
        _eventsAddress = @"Минск, г. Минск, ул. Филимонова 15, комната 207 (2 этаж, от лестницы прямо и налево). Идите по указателям.";
    }
    return _eventsAddress;
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
        textViewFrame = CGRectMake(offset * 0.8, totalHeight + offset/3, self.view.bounds.size.width - 2 * offset, self.view.bounds.size.height/5);
        _textView = [[UITextView alloc] initWithFrame:textViewFrame];
        _textView.userInteractionEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:14];
    }
    return _textView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    totalHeight = offset*0.8 + navObjectsHeight;
    self.view.backgroundColor = [UIColor whiteColor];
  
    CGRect nameLabelFrame = CGRectMake(offset, totalHeight, self.view.bounds.size.width - offset * 2, self.view.bounds.size.height/5);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
    nameLabel.font = [UIFont systemFontOfSize:21];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.eventsName;
    if ([self.eventsName length] > DEMaxCharsForBigFont)
    {
        nameLabel.adjustsFontSizeToFitWidth = YES;
    }
    else
    {
        [nameLabel sizeToFit];
    }
    [self.scrollView addSubview:nameLabel];
    totalHeight += nameLabel.bounds.size.height + offset/4;
    
    CGRect dateLabelFrame = CGRectMake(offset, totalHeight, self.view.bounds.size.width - offset * 2, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:14];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.numberOfLines = 0;
    dateLabel.text = self.eventsDate;
    [dateLabel sizeToFit];
    [self.scrollView addSubview:dateLabel];
    totalHeight += dateLabel.bounds.size.height + offset/1.5;
    
    //CGRect imageFrame = CGRectMake(offset, totalHeight, 15, 19.5);
    UIImageView * image = [[UIImageView alloc] initWithImage:[self imageWithImage:[UIImage imageNamed:@"man"] scaledToSize:CGSizeMake(35, 35)]];
    //image.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:image];
    
    CGRect countLabelFrame = CGRectMake(1.3 * offset + image.bounds.size.width, totalHeight, self.view.bounds.size.width/3, 0);
    UILabel * countLabel = [[UILabel alloc] initWithFrame:countLabelFrame];
    countLabel.font = [UIFont systemFontOfSize:14.5];
    countLabel.numberOfLines = 0;
    countLabel.text = @"4";
    [countLabel sizeToFit];
    [self.scrollView addSubview:countLabel];
    
    totalHeight += image.bounds.size.height + offset/1.5;
    NSArray *itemArray = [NSArray arrayWithObjects: @"Описание", @"Цена", @"Адрес", @"Контакты", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(20, totalHeight, self.view.bounds.size.width - 2 * offset, 30);
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
    self.textView.text = self.eventsDescription;
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addPrice
{
    self.textView.frame = textViewFrame;
    self.textView.text = self.eventsPrice;
    [self.textView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addAddress
{
    self.textView.frame = textViewFrame;
    self.textView.text = self.eventsAddress;
    [self.textView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addContacts
{
    self.textView.frame = textViewFrame;
    self.textView.text = self.eventsContacts;
    [self.textView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

@end
