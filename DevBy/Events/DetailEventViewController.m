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
        _eventsDescription = @"По сложившейся традиции в последнюю пятницу месяца в Минске проходит Python Meetup – неформальная встреча белорусских питонистов. Время и место встречи уже хорошо всем знакомы  – это клуб «Центр» во Дворце Республики, начало в 19.00.Программа апрельской встречи:Доклад №1. Дмитрий Овчинников, Wargaming \"Разработка мобильных приложений на Python \"О чем: 1. Python для мобильных девайсов. 2. Фреймворк Kivy. Птица или фрукт? 3. Один код на разных платформах (Не Java!!!) Доклад №2. Никита Гришко, Wargaming \"Python для ленивых или как сделать свою жизнь проще \"О чем: Рассмотрим, что в мире Python’а поможет сделать разработку проще на всех ее этапах: создание проекта, настройка окружения, отладка, тестирование, профилирование, публикация на PyPI. Доклад №3. Максим Барышников, WG \"Wargaming: тыл — фронту! \"О чем: Полагаю, что не открою секрет Полишинеля, если скажу следующее: чтобы игра стала успешной (а из успешной превратилась в легендарную), недостаточно  самой игры, сколь бы хороша она ни была. Помимо всего прочего, действительно массовой игре нужна очень развитая веб-часть. О ней и пойдет речь. Как обычно будет работать \"свободный микрофон\", а это значит, что любой желающий сможет выступить с блиц-докладом, не требующим предварительно подготовленной презентации. Главное – желание поделиться чем-то интересным и полезным.    Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ' Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ   Технологии: XML/XSLT, .NET (C#; ASP.NET), sql, HTML/DHTML         Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu";
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
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    totalHeight = offset*0.4 + navObjectsHeight;
    self.view.backgroundColor = [UIColor whiteColor];
  
    CGRect nameLabelFrame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, self.view.bounds.size.height/5);
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
    
    CGRect dateLabelFrame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 0);
    UILabel * dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:14];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.numberOfLines = 0;
    dateLabel.text = self.eventsDate;
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
    countLabel.text = @"4";
    [countLabel sizeToFit];
    [self.scrollView addSubview:countLabel];
    
    totalHeight += image.bounds.size.height + offset/1.5;
    NSArray *itemArray = [NSArray arrayWithObjects: @"Описание", @"Цена", @"Адрес", @"Контакты", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(offset / 2, totalHeight, self.view.bounds.size.width - offset, 30);
    totalHeight += segmentedControl.bounds.size.height;
    [segmentedControl addTarget:self action:@selector(touchSegmentedControl:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self.scrollView addSubview:self.textView];
    [self addTextContentToTextView:self.eventsDescription];
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
        [self addTextContentToTextView:self.eventsDescription];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {
        [self addTextContentToTextView:self.eventsPrice];
    }
    else if(segmentedControl.selectedSegmentIndex == 2)
    {
        [self addTextContentToTextView:self.eventsAddress];
    }
    else if(segmentedControl.selectedSegmentIndex == 3)
    {
        [self addTextContentToTextView:self.eventsContacts];
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
