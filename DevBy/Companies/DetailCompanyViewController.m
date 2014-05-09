//
//  DetailCompanyViewController.m
//  DevBy
//
//  Created by Anastasia on 4/12/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailCompanyViewController.h"
#import "CommentsCell.h"
#import "FeedbackCell.h"
#import "Constants.h"

@interface DetailCompanyViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    float totalHeight;
    float commentsHeight;
    float feedbacksHeight;
    CGRect textViewFrame;
    NSMutableArray *commentsCellsArray;
    NSMutableArray *feedbackCellsArray;
    
    UIView* backView;
    
    int previousSelectedSegment;
    UISegmentedControl *segmentControl;
    UIView* moveView;
}

@property(nonatomic, strong)NSString * companysDescription;
@property(nonatomic, strong)NSString * description;
@property(nonatomic, strong)NSString * employeeNumber;
@property(nonatomic, strong)UITextView * textView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)NSMutableArray * comments;
@property(nonatomic, strong)UITableView * commentsTableView;
@property(nonatomic, strong)UITableView * feedBackTableView;

@end

@implementation DetailCompanyViewController

-(NSString *)description
{
    if (!_description)
    {
        _description = @"ИТ-аутсорсинг, Разработка ПО на заказ, Веб-разработка, Разработка мобильных приложений, Разработка встраиваемого ПО, Банковское ПО, Образовательные услуги";
    }
    return _description;
}
-(NSString *)employeeNumber
{
    if (!_employeeNumber)
    {
        _employeeNumber = @"45";
    }
    return _employeeNumber;
}

-(UITextView *)textView
{
    if (!_textView)
    {
        textViewFrame = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, self.view.bounds.size.height/5);
        _textView = [[UITextView alloc] initWithFrame:textViewFrame];
        _textView.userInteractionEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:DCTextViewFont];
    }
    return _textView;
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

-(NSMutableArray *)comments
{
    if (!_comments)
    {
        _comments = [[NSMutableArray alloc] initWithArray:@[@"Comment 1", @"Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника"]];
    }
    return _comments;
}

-(NSString *)companysDescription
{
    if (!_companysDescription)
    {
        _companysDescription = @"Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ' Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ   Технологии: XML/XSLT, .NET (C#; ASP.NET), sql, HTML/DHTML         Мы ищем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuuepogjqiugporejgpjrqepighqeg'igrdg[ijq'ghoaaooerhgohehoia'gheriohgoierhaio'hg'aerhiorhrguhdrfuhgauarhiughaurhgpurejgjhohgughreepuhagpusrhgpuheruhgahpfohaoghroehjagoiaerj[oigaja[oriojgtiajerigjiarjg'aijer'igjairjgiarjg'ija'kkreщем способного разработчика для участия в реализации интересных и масштабных коммерческих проектов! Наши заказчики - крупные международные компании \nУсловия работы:Высокая официальная зарплата Спокойный, дружелюбный коллектив Современный офис в Silver Tower, комфортные рабочие места Нормированный восьмичасовой рабочий день Гибкий график работы Полный соцпакет Дополнительные премии по результатам работы Корпоративные праздники и путешествияierjgpiwejgijqeoirgjoierjgijer[gijeoigj]peirjg[iergprrm;ogritm4ljhgoirjgurhgiijerbuv'npqbv[oq4n[vi[ptin3[tup4opjoearg'jasrooijjtoajg'iuu'";
    }
    return _companysDescription;
}

- (CommentsCell*) initilizeCommentsCellwithUsername:(NSString*) username date:(NSString*) date comments :(NSString*)comments offset:(int)offset
{
    CommentsCell* cell = [[CommentsCell alloc]init];
    cell.username = username;
    cell.date = date;
    cell.comment = comments;
    [cell drawCellWithOffset:offset];
    return cell;
}

-(void)calculateCommentsTableViewHeights
{
    commentsCellsArray = [NSMutableArray array];
    NSString * comment = @"Не могу согласится. Мысли в рамках одной User story без мыслей на будущее замедляют внедрение новых фич, которые будут зависеть от данной US. Есть же замечательная пословица: \"7 раз отмерь - 1 отрежь\". Почему не следовать ей и в программировании? Кода с неприятным запахом было куда бы меньше.P.S. общался с людьми, пишущих на Java в vim-е ;)";
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:1]];
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:2]];
    //    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:3]];
    //    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    //    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    //    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    
    for (CommentsCell* cell in commentsCellsArray)
    {
        commentsHeight += cell.totalHeight;
    }
}

- (FeedbackCell*) initilizeFeedbackCellwithUsername:(NSString*) username date:(NSString*) date comment:(NSString*)comments
{
    FeedbackCell* cell = [[FeedbackCell alloc]init];
    cell.username = username;
    cell.date = date;
    cell.comment = comments;
    cell.jobExperience = @"Работает в Altoros Development: больше 5 лет 26 июня 2013, 17:08";
    cell.rating = @"Оценка: 3.9 ";
    cell.color = greenColor;
    [cell drawCell];
    return cell;
}

-(void)calculateFeedbackTableViewHeights
{
    feedbackCellsArray = [NSMutableArray array];
    NSString * comment = @"Не могу согласится. Мысли в рамках одной User story без мыслей на будущее замедляют внедрение новых фич, которые будут зависеть от данной US. Есть же замечательная пословица: \"7 раз отмерь - 1 отрежь\". Почему не следовать ей и в программировании? Кода с неприятным запахом было куда бы меньше.P.S. общался с людьми, пишущих на Java в vim-е ;)";
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    //    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    //    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    //    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    //    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    //    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    //    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    
    for (FeedbackCell* cell in feedbackCellsArray)
    {
        feedbacksHeight += cell.totalHeight;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    commentsHeight = 0;
    feedbacksHeight = 0;
    
    [self calculateCommentsTableViewHeights];
    [self calculateFeedbackTableViewHeights];
    
    totalHeight = 0;
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    if (navObjectsHeight == 0)
    {
        navObjectsHeight = navBarHeight;
    }
    totalHeight += offset*0.8 + navObjectsHeight;
    CGRect nameLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset - DCLogoHeight, DCLogoHeight);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
    nameLabel.font = [UIFont systemFontOfSize:DCNameLabelFont];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.companysName;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:nameLabel];
    
    totalHeight += nameLabel.bounds.size.height;
    CGRect employeeLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width, DCLogoHeight);
    UILabel * employeeNumberLabel = [[UILabel alloc] initWithFrame:employeeLabelRect];
    employeeNumberLabel.text = [NSString stringWithFormat:@"Число сотрудников: %@", self.employeeNumber];
    employeeNumberLabel.font = [UIFont systemFontOfSize:DCEmployeeNumberFont];
    employeeNumberLabel.textColor = [UIColor grayColor];
    [employeeNumberLabel sizeToFit];
    [self.scrollView addSubview:employeeNumberLabel];
    
    CGRect logoViewRect = CGRectMake( self.view.bounds.size.width - offset - DCLogoHeight, nameLabelRect.origin.y + 5, DCLogoHeight, DCLogoHeight);
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:logoViewRect];
    logoView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:logoView];
    
    totalHeight += employeeNumberLabel.bounds.size.height + offset/3;
    CGRect descriptionLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, self.view.bounds.size.height/5);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelRect];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.description;
    descriptionLabel.font = [UIFont systemFontOfSize:DCDescriptionLabelFont];
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:descriptionLabel];
    
    totalHeight += descriptionLabel.bounds.size.height + offset/2;
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"О компании", @"Обсуждение", @"Отзывы", nil];
    segmentControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentControl.frame = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, 30);
    totalHeight += segmentControl.bounds.size.height + offset/3;
    [segmentControl addTarget:self action:@selector(touchSegmentedControl:) forControlEvents: UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    previousSelectedSegment = 0;
    [self.scrollView addSubview:segmentControl];
    
    [self addCompanyDescription];
    
    backView = [[UIView alloc]initWithFrame:self.textView.frame];
    self.textView.frame = backView.bounds;
    
    [backView addSubview:self.textView];
    [self.scrollView addSubview:backView];
    
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeRight setDirection:(UISwipeGestureRecognizerDirectionRight )];
    [backView addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeLeft setDirection:(UISwipeGestureRecognizerDirectionLeft )];
    [backView addGestureRecognizer:swipeLeft];
}


-(void)addCompanyDescription
{
    self.textView.text = self.companysDescription;
    CGFloat height = [self textViewHeightForAttributedText:self.textView.attributedText andWidth:textViewFrame.size.width];
    self.textView.frame = CGRectMake(textViewFrame.origin.x, textViewFrame.origin.y, textViewFrame.size.width, height);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.frame.size.height);
    moveView = self.textView;
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight && previousSelectedSegment == 1)
    {
        [self moveTextView:self.textView toDirection:MOVE_RIGHT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment =  0;
        return;
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft && previousSelectedSegment == 0)
    {
        [self setDiscussionView];
        [self moveTextView:self.commentsTableView toDirection:MOVE_LEFT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment = 1;
        return;
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight && previousSelectedSegment == 2)
    {
        [self setDiscussionView];
        [self moveTextView:self.commentsTableView toDirection:MOVE_RIGHT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment = 1;
        return;
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft && previousSelectedSegment == 1)
    {
        [self setFeedbackView];
        [self moveTextView:self.feedBackTableView toDirection:MOVE_LEFT];
        segmentControl.selectedSegmentIndex = previousSelectedSegment = 2;
        return;
    }
}


-(void)touchSegmentedControl:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        [self moveTextView:self.textView toDirection:MOVE_RIGHT];
    }
    else if (segmentedControl.selectedSegmentIndex == 1 && previousSelectedSegment == 2)
    {
        [self setDiscussionView];
        [self moveTextView:self.commentsTableView toDirection:MOVE_RIGHT];
    }
    else if (segmentedControl.selectedSegmentIndex == 1 && previousSelectedSegment == 0)
    {
        [self setDiscussionView];
        [self moveTextView:self.commentsTableView toDirection:MOVE_LEFT];
    }
    else if (segmentedControl.selectedSegmentIndex == 2)
    {
        [self setFeedbackView];
        [self moveTextView:self.feedBackTableView toDirection:MOVE_LEFT];
    }
    previousSelectedSegment = segmentedControl.selectedSegmentIndex;
}

#pragma mark - Companys Discussion


-(void)setDiscussionView
{
    self.commentsTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.scrollView.center.x - (textViewFrame.size.width)/2, textViewFrame.origin.y, textViewFrame.size.width, commentsHeight)];
    self.commentsTableView.userInteractionEnabled = NO;
    self.commentsTableView.delegate = self;
    self.commentsTableView.dataSource = self;
}

#pragma mark - Companys Fedback


-(void)setFeedbackView
{
    self.feedBackTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.scrollView.center.x - (textViewFrame.size.width)/2, textViewFrame.origin.y, textViewFrame.size.width, feedbacksHeight)];
    self.feedBackTableView.userInteractionEnabled = NO;
    self.feedBackTableView.delegate = self;
    self.feedBackTableView.dataSource = self;
}

- (void)moveTextView:(UIView *)view toDirection:(NSString *)direction
{
    
    if ([direction isEqualToString:MOVE_LEFT])
        view.frame = CGRectMake(backView.bounds.origin.x + backView.bounds.size.width, backView.bounds.origin.y,backView.frame.size.width, view.frame.size.height);
    else
        view.frame = CGRectMake(backView.bounds.origin.x - backView.bounds.size.width, backView.bounds.origin.y,backView.frame.size.width, view.frame.size.height);
    
    [backView addSubview:view];
    
    [UIView animateWithDuration:.23 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        if ([direction isEqualToString:MOVE_LEFT])
            moveView.frame = CGRectMake(backView.bounds.origin.x - backView.bounds.size.width, backView.bounds.origin.y, backView.bounds.size.width, backView.bounds.size.height);
        else
            moveView.frame = CGRectMake(backView.bounds.origin.x + backView.bounds.size.width, backView.bounds.origin.y, backView.bounds.size.width, backView.bounds.size.height);
        view.frame = CGRectMake(backView.bounds.origin.x, backView.bounds.origin.y, backView.bounds.size.width, view.bounds.size.height);
    } completion:^(BOOL finished) {
        if(finished)
        {
            [moveView removeFromSuperview];
            moveView = view;
            if(self.view.frame.size.height - totalHeight <= view.frame.size.height)
            {
                backView.frame = CGRectMake(backView.frame.origin.x, backView.frame.origin.y, backView.frame.size.width, view.bounds.size.height);
                [self.scrollView setContentOffset:CGPointZero animated:YES];
            }
            else
                backView.frame = CGRectMake(backView.frame.origin.x, backView.frame.origin.y, backView.frame.size.width, self.view.frame.size.height - totalHeight);
        }
    }];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + view.frame.size.height);
}








- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.commentsTableView)
    {
        return [commentsCellsArray count];
    }
    else
    {
        return [feedbackCellsArray count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.commentsTableView)
    {
        return ((CommentsCell *)[commentsCellsArray objectAtIndex:indexPath.row]).totalHeight;
    }
    else
    {
        return ((FeedbackCell *)[feedbackCellsArray objectAtIndex:indexPath.row]).totalHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.commentsTableView)
    {
        return (CommentsCell *)[commentsCellsArray objectAtIndex:indexPath.row];
    }
    else
    {
        return (FeedbackCell *)[feedbackCellsArray objectAtIndex:indexPath.row];
    }
}

-(void)configureCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[CommentsCell class]])
    {
        CommentsCell * commentCell = (CommentsCell *)cell;
        commentCell.username = @"Username";
        commentCell.date = @"24 April 2014, 15:07";
        commentCell.comment = @"Ответ очень простой: хочу - отвечаю, не хочу - не отвечаю. Ситуация целиком и полностью зависит от мотивации работника, от того считает ли что он ответственен за результат в целом, живет ли он проектом или он просто отрабатывает определенное время за деньги. В моей карьере случалось по разному.";
        
        if (indexPath.row > 8)
        {
            [commentCell drawCellWithOffset:0];
        }
        else if (indexPath.row > 4)
        {
            [commentCell drawCellWithOffset:4];
        }
        else if (indexPath.row > 3)
        {
            [commentCell drawCellWithOffset:3];
        }
        else if (indexPath.row > 2)
        {
            [commentCell drawCellWithOffset:2];
        }
        else if (indexPath.row > 1)
        {
            [commentCell drawCellWithOffset:1];
        }
        else
        {
            [commentCell drawCellWithOffset:0];
        }
    }
    else if ([cell isKindOfClass:[FeedbackCell class]])
    {
        FeedbackCell * commentCell = (FeedbackCell *)cell;
        commentCell.color = greenColor;
        commentCell.jobExperience = @"Проработал в Altoros Development: больше 9 лет 21 августа 2013, 09:19";
        commentCell.username = @"Username";
        commentCell.rating = @"Оценка: 3.9";
        commentCell.date = @"24 April 2014, 15:07";
        commentCell.comment = @"Ответ очень простой: хочу - отвечаю, не хочу - не отвечаю. Ситуация целиком и полностью зависит от мотивации работника, от того считает ли что он ответственен за результат в целом, живет ли он проектом или он просто отрабатывает определенное время за деньги. В моей карьере случалось по разному.";
        [commentCell drawCell];
    }
    
}

@end
