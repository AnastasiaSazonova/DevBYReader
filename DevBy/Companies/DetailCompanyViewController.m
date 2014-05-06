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
<<<<<<< HEAD

float const offset = 20.0f;
float const nameLabelFont = 28.0f;
float const descriptionLabelFont = 15.0f;
float const employeeNumberFont = 13.0f;
float const textViewFont = 14.0f;
float const logoHeight = 45.0;
static float navBarHeight = 64.0f;
=======
#import "Constants.h"
>>>>>>> sazonova

@interface DetailCompanyViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    float totalHeight;
    float commentsHeight;
    float feedbacksHeight;
    CGRect textViewFrame;
    NSMutableArray *commentsCellsArray;
    NSMutableArray *feedbackCellsArray;
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
<<<<<<< HEAD
        _textView.font = [UIFont systemFontOfSize:textViewFont];
=======
        _textView.font = [UIFont systemFontOfSize:DCTextViewFont];
>>>>>>> sazonova
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
        _companysDescription = @"Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ' Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ'";
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
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:3]];
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    [commentsCellsArray addObject:[self initilizeCommentsCellwithUsername:@"FirstUser" date:@"01.01.01" comments:comment offset:0]];
    
    for (CommentsCell* cell in commentsCellsArray)
    {
        commentsHeight += cell.totalHeight;
    }
}

- (FeedbackCell*) initilizeFeedbackCellwithUsername:(NSString*) username
                                               date:(NSString*) date
                                            comment:(NSString*)comments
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
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    [feedbackCellsArray addObject:[self initilizeFeedbackCellwithUsername:@"FirstUser" date:@"01.01.01" comment:comment]];
    
    for (FeedbackCell* cell in feedbackCellsArray)
    {
        feedbacksHeight += cell.totalHeight;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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
<<<<<<< HEAD
<<<<<<< HEAD
    CGRect nameLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset - logoHeight, logoHeight);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
    nameLabel.font = [UIFont systemFontOfSize:nameLabelFont];
=======
    CGRect nameLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset - DCLogoHeight, DCLogoHeight);
=======
    CGRect nameLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset - DCLogoHeight, DCLogoHeight);
>>>>>>> sazonova
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
    nameLabel.font = [UIFont systemFontOfSize:DCNameLabelFont];
>>>>>>> sazonova
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.companysName;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:nameLabel];
    
    totalHeight += nameLabel.bounds.size.height;
<<<<<<< HEAD
<<<<<<< HEAD
    CGRect employeeLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width, logoHeight);
    UILabel * employeeNumberLabel = [[UILabel alloc] initWithFrame:employeeLabelRect];
    employeeNumberLabel.text = [NSString stringWithFormat:@"Число сотрудников: %@", self.employeeNumber];
    employeeNumberLabel.font = [UIFont systemFontOfSize:employeeNumberFont];
=======
    CGRect employeeLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width, DCLogoHeight);
=======
    CGRect employeeLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width, DCLogoHeight);
>>>>>>> sazonova
    UILabel * employeeNumberLabel = [[UILabel alloc] initWithFrame:employeeLabelRect];
    employeeNumberLabel.text = [NSString stringWithFormat:@"Число сотрудников: %@", self.employeeNumber];
    employeeNumberLabel.font = [UIFont systemFontOfSize:DCEmployeeNumberFont];
>>>>>>> sazonova
    employeeNumberLabel.textColor = [UIColor grayColor];
    [employeeNumberLabel sizeToFit];
    [self.scrollView addSubview:employeeNumberLabel];
    
<<<<<<< HEAD
    CGRect logoViewRect = CGRectMake( self.view.bounds.size.width - offset - logoHeight, nameLabelRect.origin.y + 5, logoHeight, logoHeight);
=======
    CGRect logoViewRect = CGRectMake( self.view.bounds.size.width - offset - DCLogoHeight, nameLabelRect.origin.y + 5, DCLogoHeight, DCLogoHeight);
>>>>>>> sazonova
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:logoViewRect];
    logoView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:logoView];
    
    totalHeight += employeeNumberLabel.bounds.size.height + offset/3;
    CGRect descriptionLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, self.view.bounds.size.height/5);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelRect];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.description;
<<<<<<< HEAD
    descriptionLabel.font = [UIFont systemFontOfSize:descriptionLabelFont];
=======
    descriptionLabel.font = [UIFont systemFontOfSize:DCDescriptionLabelFont];
>>>>>>> sazonova
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:descriptionLabel];
    
    totalHeight += descriptionLabel.bounds.size.height + offset/2;
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"О компании", @"Обсуждение", @"Отзывы", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, 30);
    totalHeight += segmentedControl.bounds.size.height + offset/3;
    [segmentedControl addTarget:self action:@selector(touchSegmentedContorol:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self addCompanyDescription];
    [self.scrollView addSubview:segmentedControl];
    [self.view addSubview:self.scrollView];
}

-(void)touchSegmentedContorol:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == companysDescription)
    {
        [self addCompanyDescription];
    }
    else if(segmentedControl.selectedSegmentIndex == companysDiscussion)
    {
        [self addCompanysDiscussion];
    }
    else if(segmentedControl.selectedSegmentIndex == companysFeedback)
    {
        [self addCompanysFeedback];
    }
}

-(void)addCompanyDescription
{
    [self cleanTextView];
    self.textView.frame = textViewFrame;
    self.textView.text = self.companysDescription;
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addCompanysDiscussion
{
    [self cleanTextView];
    [self setDiscussionView];
    [self.scrollView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.commentsTableView.bounds.size.height );
}


-(void)setDiscussionView
{
    CGRect frame = self.textView.frame;
    frame.size.height += self.view.bounds.size.height;
    self.commentsTableView = [[UITableView alloc]initWithFrame:frame];
    self.commentsTableView.userInteractionEnabled = NO;
    self.commentsTableView.delegate = self;
    self.commentsTableView.dataSource = self;
    self.commentsTableView.frame = CGRectMake(self.scrollView.center.x - (textViewFrame.size.width)/2, textViewFrame.origin.y, textViewFrame.size.width, commentsHeight);
    [self.scrollView addSubview:self.commentsTableView];
}

-(void)addCompanysFeedback
{
    [self cleanTextView];
    [self setFeedbackView];
    [self.scrollView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.feedBackTableView.bounds.size.height);
}

-(void)cleanTextView
{
    if (self.textView)
    {
        [self.textView removeFromSuperview];
    }
    if (self.commentsTableView)
    {
        [self.commentsTableView removeFromSuperview];
    }
    if (self.feedBackTableView)
    {
        [self.feedBackTableView removeFromSuperview];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

<<<<<<< HEAD
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
=======
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
>>>>>>> sazonova
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

-(void)setFeedbackView
{
    CGRect frame = textViewFrame;
    frame.size.height += self.view.bounds.size.height/3;
    self.feedBackTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.scrollView.center.x - (textViewFrame.size.width)/2, textViewFrame.origin.y, textViewFrame.size.width, feedbacksHeight)];
    self.feedBackTableView.userInteractionEnabled = NO;
    self.feedBackTableView.delegate = self;
    self.feedBackTableView.dataSource = self;
    [self.scrollView addSubview:self.feedBackTableView];
}

@end
