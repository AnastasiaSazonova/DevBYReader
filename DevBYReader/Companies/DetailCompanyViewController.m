//
//  DetailCompanyViewController.m
//  DevBy
//
//  Created by Anastasia on 4/12/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailCompanyViewController.h"
#import "CommentsCell.h"
#import "CommentsTableView.h"

float const offset = 20.0f;
float const nameLabelFont = 28.0f;
float const descriptionLabelFont = 15.0f;
float const employeeNumberFont = 13.0f;
float const textViewFont = 14.0f;
float const logoHeight = 45.0;

@interface DetailCompanyViewController ()
{
    NSString * description;
    NSString * employeeNumber;
    float totalHeight;
    CGRect textViewFrame;
}

@property(nonatomic, strong)NSString * companysDescription;
@property(nonatomic, strong)UITextView * textView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)NSMutableArray * comments;
@property(nonatomic, strong)CommentsTableView * commentsTable;

@end

@implementation DetailCompanyViewController

-(UITextView *)textView
{
    if (!_textView)
    {
        textViewFrame = CGRectMake(offset * 0.8, totalHeight, self.view.bounds.size.width - 2 * offset, self.view.bounds.size.height/5);
        _textView = [[UITextView alloc] initWithFrame:textViewFrame];
        _textView.userInteractionEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:textViewFont];
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
        _companysDescription = [[NSString alloc] init];
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
    totalHeight += offset + navObjectsHeight;
    CGRect nameLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset - logoHeight, logoHeight);
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
    nameLabel.font = [UIFont systemFontOfSize:nameLabelFont];
    nameLabel.numberOfLines = 0;
    nameLabel.text = self.companysName;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.scrollView addSubview:nameLabel];
    
    employeeNumber = @"45";
    totalHeight += nameLabel.bounds.size.height + offset/3;
    CGRect employeeLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width, logoHeight);
    UILabel * employeeNumberLabel = [[UILabel alloc] initWithFrame:employeeLabelRect];
    employeeNumberLabel.text = [NSString stringWithFormat:@"Число сотрудников: %@", employeeNumber];
    employeeNumberLabel.font = [UIFont systemFontOfSize:employeeNumberFont];
    employeeNumberLabel.textColor = [UIColor grayColor];
    [employeeNumberLabel sizeToFit];
    [self.scrollView addSubview:employeeNumberLabel];
    
    CGRect logoViewRect = CGRectMake( self.view.bounds.size.width - offset - logoHeight, offset + navObjectsHeight, logoHeight, logoHeight);
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:logoViewRect];
    logoView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:logoView];
    
    description = @"ИТ-аутсорсинг, Разработка ПО на заказ, Веб-разработка, Разработка мобильных приложений, Разработка встраиваемого ПО, Банковское ПО, Образовательные услуги";
    totalHeight += employeeNumberLabel.bounds.size.height + offset/3;
    CGRect descriptionLabelRect = CGRectMake(offset, totalHeight, self.view.bounds.size.width - 2 * offset, self.view.bounds.size.height/5);
    UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelRect];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = description;
    descriptionLabel.font = [UIFont systemFontOfSize:descriptionLabelFont];
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
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        [self addCompanyDescription];
    }
    else if(segmentedControl.selectedSegmentIndex == 1)
    {
        [self addCompanysDiscussion];
    }
    else if(segmentedControl.selectedSegmentIndex == 2)
    {
        [self addCompanysFeedback];
    }
}

-(void)addCompanyDescription
{
    if (self.commentsTable)
    {
        [self.commentsTable removeFromSuperview];
    }
    self.textView.frame = textViewFrame;
    self.textView.text = self.companysDescription;
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addCompanysDiscussion
{
    if (self.textView)
    {
        [self.textView removeFromSuperview];
    }
    [self setDiscussionView];
    [self.scrollView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addCompanysFeedback
{
    if (self.commentsTable)
    {
        [self.commentsTable removeFromSuperview];
    }
    self.textView.frame = textViewFrame;
    self.textView.text = @"Отзывы";
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)setDiscussionView
{
    self.commentsTable = [[CommentsTableView alloc] initWithFrame:textViewFrame comments:self.comments];
    self.commentsTable.frame = CGRectMake(self.commentsTable.frame.origin.x, self.commentsTable.frame.origin.y, self.commentsTable.frame.size.width, self.commentsTable.tableHeight);
    [self.textView removeFromSuperview];
    [self.scrollView addSubview:self.commentsTable];
}

















@end
