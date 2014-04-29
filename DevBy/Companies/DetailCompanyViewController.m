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
    CGRect textViewFrame;
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
        textViewFrame = CGRectMake(offset * 0.8, totalHeight, self.view.bounds.size.width - 2 * offset, self.view.bounds.size.height/5);
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
        _companysDescription = @"Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ' Одним из достоинств нашей компании является полномасштабный спектр инновационных и комплексных проектных решений и услуг в сфере информационных технологий, предлагаемых заказчикам. Высокое качество проектных решений и услуг является стратегической идеей руководства IBA и каждого сотрудника. Это позволило нам за последние годы существенно увеличить объемы работ на рынке стран СНГ, международном рынке и приобрести новых заказчиков во многих странах мира. Мы признательны за интерес к нашей компании и полны решимости развивать наш успех, базируясь на наших принципах, выраженных девизами 'Качество-Надежность-Безопасность' и 'Информационные технологии без границ'";
    }
    return _companysDescription;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    totalHeight = 0;
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    if (navObjectsHeight == 0)
    {
        navObjectsHeight = navBarHeight;
    }
    totalHeight += offset*0.8 + navObjectsHeight;
    CGRect nameLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset - DCLogoHeight, DCLogoHeight);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
    nameLabel.font = [UIFont systemFontOfSize:DCNameLabelFont];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.companysName;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:nameLabel];
    
    totalHeight += nameLabel.bounds.size.height;
    CGRect employeeLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width, DCLogoHeight);
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
    CGRect descriptionLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset, self.view.bounds.size.height/5);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelRect];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.description;
    descriptionLabel.font = [UIFont systemFontOfSize:DCDescriptionLabelFont];
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:descriptionLabel];
    
    totalHeight += descriptionLabel.bounds.size.height + offset/2;
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"О компании", @"Обсуждение", @"Отзывы", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset, 30);
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
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.commentsTableView.bounds.size.height);
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.commentsTableView)
    {
        return 10;
    }
    else if(tableView == self.feedBackTableView)
    {
        return 3;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.commentsTableView)
    {
        CommentsCell * cell = [[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
        [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
        return cell.totalHeight;
    }
    else
    {
        FeedbackCell * cell = [[FeedbackCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
        [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
        return cell.totalHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.commentsTableView)
    {
        CommentsCell * cell = [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
        [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
        return cell;
    }
    else
    {
        FeedbackCell * cell = [[FeedbackCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FeedbackCell"];
        [self configureCell:cell inTableView:tableView forIndexPath:indexPath];
        return cell;
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
        [commentCell drawCellWithOffset:0];
    }
        
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row < 9)
//    {
//        CGRect frame = textViewFrame;
//        frame.size.height += cell.bounds.size.height;
//        self.commentsTableView.frame = frame;
//    }
//    else
//    {
//        CGRect frame = textViewFrame;
//        frame.size.height += cell.bounds.size.height;
//        self.commentsTableView.frame = frame;
//    }
}

-(void)setDiscussionView
{
    CGRect frame = textViewFrame;
    frame.size.height += self.view.bounds.size.height;
    self.commentsTableView = [[UITableView alloc]initWithFrame:frame];
    self.commentsTableView.userInteractionEnabled = NO;
    self.commentsTableView.delegate = self;
    self.commentsTableView.dataSource = self;
    [self.scrollView addSubview:self.commentsTableView];
}

-(void)setFeedbackView
{
    CGRect frame = textViewFrame;
    frame.size.height += self.view.bounds.size.height/3;
    self.feedBackTableView = [[UITableView alloc]initWithFrame:frame];
    self.feedBackTableView.userInteractionEnabled = NO;
    self.feedBackTableView.delegate = self;
    self.feedBackTableView.dataSource = self;
    [self.scrollView addSubview:self.feedBackTableView];
}

@end
