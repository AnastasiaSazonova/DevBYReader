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
#import "Protocols.h"
#import "CommentsButton.h"
#import "AFNetworking.h"
#import "CompanyDetailSerializer.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface DetailCompanyViewController ()<UITableViewDataSource, UITableViewDelegate, CommentsProtocol>
{
    float totalHeight;
    float commentsHeight;
    float feedbacksHeight;
    CGRect textViewFrame;
    NSMutableArray *commentsCellsArray;
    NSMutableArray *feedbackCellsArray;
    
    CompaniesParser *companiesParser;
    CompanyDetail *companyDetail;
    NSString *postfix;
    
    AFHTTPRequestOperationManager *requestOperationManager;
    UIActivityIndicatorView *loadingSpinner;
}

@property(nonatomic, strong)UITextView * textView;
@property(nonatomic, strong)UIScrollView * scrollView;
@property(nonatomic, strong)NSMutableArray * comments;
@property(nonatomic, strong)UITableView * commentsTableView;
@property(nonatomic, strong)UITableView * feedBackTableView;

@end

@implementation DetailCompanyViewController

- (id)initWithPostfix:(NSString *)companysPostfix
{
    self = [super init];
    if(self)
    {
        postfix = companysPostfix;
    }
    return self;
}

-(UITextView *)textView
{
    if (!_textView)
    {
        textViewFrame = CGRectMake(offset * 0.3, totalHeight, self.view.bounds.size.width - 0.6 * offset, self.view.bounds.size.height/5);
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
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, navBarHeight, self.view.bounds.size.width, self.view.bounds.size.height - navBarHeight)];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _scrollView;
}

-(void)calculateCommentsTableViewHeights
{
    commentsCellsArray = [NSMutableArray array];
    
    for(Comment *item in companyDetail.comments)
    {
        CommentsCell *cell = [[CommentsCell alloc] init];
        cell.username = item.username;
        cell.date = item.date;
        cell.comment = item.comment;
        [cell drawCellWithOffset:item.level];
        
        [commentsCellsArray addObject:cell];
    
        commentsHeight += cell.totalHeight;
    }
}

-(void)calculateFeedbackTableViewHeights
{
    feedbackCellsArray = [NSMutableArray array];
    
    for(Review *item in companyDetail.reviews)
    {
        FeedbackCell* cell = [[FeedbackCell alloc]init];
        cell.username = item.username;
        cell.date = item.date;
        cell.comment = item.comment;
        cell.jobExperience = item.jobExperience;
        cell.rating = item.rating;
        cell.color = item.color;
        cell.commentsCount = item.commentsCount;
        cell.btnLink = item.btnLink;
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell drawCell];
        
        [feedbackCellsArray addObject:cell];
    
        feedbacksHeight += cell.totalHeight;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    commentsHeight = 0;
    feedbacksHeight = 0;
    
    companiesParser = [[CompaniesParser alloc] init];
    //companyDetail = [companiesParser getDetailInfoOf:postfix];
    
    //////
    NSString *prefixCompanyUrl = [NSString stringWithFormat:@"%@%@", COMPANYPREFIX, postfix];
    NSURL *companiesUrl = [NSURL URLWithString:prefixCompanyUrl];
    
    loadingSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loadingSpinner.frame = self.view.frame;
    [loadingSpinner startAnimating];
    [self.view addSubview:loadingSpinner];
    
    requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:companiesUrl];
    CompanyDetailSerializer *companyDetailSerializer = [[CompanyDetailSerializer alloc] initWithCompanyName:postfix];
    requestOperationManager.responseSerializer = companyDetailSerializer;
    
    [requestOperationManager GET:prefixCompanyUrl
                      parameters:nil
                         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         companyDetail = (CompanyDetail *)responseObject;
         [loadingSpinner stopAnimating];
         
         //begin rendering
         [self calculateCommentsTableViewHeights];
         [self calculateFeedbackTableViewHeights];
         
         totalHeight = 0;
         float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
         if (navObjectsHeight == 0)
         {
             navObjectsHeight = navBarHeight;
         }
         totalHeight += offset*0.8;
         CGRect nameLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset - DCLogoHeight, DCLogoHeight);
         UILabel * nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
         nameLabel.font = [UIFont systemFontOfSize:DCNameLabelFont];
         nameLabel.numberOfLines = 0;
         nameLabel.text = companyDetail.name;
         nameLabel.adjustsFontSizeToFitWidth = YES;
         [nameLabel sizeToFit];
         [self.scrollView addSubview:nameLabel];
         
         totalHeight += nameLabel.bounds.size.height;
         CGRect employeeLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width, DCLogoHeight);
         UILabel * employeeNumberLabel = [[UILabel alloc] initWithFrame:employeeLabelRect];
         employeeNumberLabel.text = [NSString stringWithFormat:@"Число сотрудников: %@", companyDetail.workersCount];
         employeeNumberLabel.font = [UIFont systemFontOfSize:DCEmployeeNumberFont];
         employeeNumberLabel.textColor = [UIColor grayColor];
         [employeeNumberLabel sizeToFit];
         [self.scrollView addSubview:employeeNumberLabel];
         
         totalHeight += employeeNumberLabel.bounds.size.height + offset/3;
         CGRect descriptionLabelRect = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, 5);
         UILabel * descriptionLabel = [[UILabel alloc] initWithFrame:descriptionLabelRect];
         descriptionLabel.numberOfLines = 0;
         descriptionLabel.text = [companyDetail.fullName stringByReplacingOccurrencesOfString:@"\n" withString:@""];
         descriptionLabel.font = [UIFont systemFontOfSize:DCDescriptionLabelFont];
         descriptionLabel.textColor = [UIColor grayColor];
         descriptionLabel.adjustsFontSizeToFitWidth = YES;
         [descriptionLabel sizeToFit];
         [self.scrollView addSubview:descriptionLabel];
         
         totalHeight += descriptionLabel.bounds.size.height + offset;
         
         NSArray *itemArray = [NSArray arrayWithObjects: @"О компании", @"Обсуждение", @"Отзывы", nil];
         UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
         segmentedControl.frame = CGRectMake(offset/2, totalHeight, self.view.bounds.size.width - offset, 30);
         totalHeight += segmentedControl.bounds.size.height + offset/3;
         [segmentedControl addTarget:self action:@selector(touchSegmentedContorol:) forControlEvents: UIControlEventValueChanged];
         segmentedControl.selectedSegmentIndex = 0;
         [self addCompanyDescription];
         [self.scrollView addSubview:segmentedControl];
         [self.view addSubview:self.scrollView];
         //end rendering
         
     }failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if(error.code != -999)
         {
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ошибка"
                                                                 message:[error localizedDescription]
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
             [alertView show];
         }
     }];
    //////
}

- (void)gotoComments:(CommentsButton *)button
{
    CommentsParser *parser = [[CommentsParser alloc] init];
    NSMutableArray *comments = [parser getCommentsWithUrl:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", COMPANYPREFIX, button.buttonLink]] andAddress:@"//div[@class='comments-list list-more']/div[@class='clearfix comment']"];
    NSArray *result = [NSArray arrayWithArray:comments];
    CommentsViewController *commentsController = [[CommentsViewController alloc] initWithComments:result];
    
    [self.navigationController pushViewController:commentsController animated:YES];
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
    self.textView.text = companyDetail.about;
    if(companyDetail.about == nil)
    {
        self.textView.text = @"Нет данных";
    }
    [self.textView sizeToFit];
    [self.scrollView addSubview:self.textView];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.textView.bounds.size.height);
}

-(void)addCompanysDiscussion
{
    [self cleanTextView];
    [self setDiscussionView];
    if(commentsCellsArray.count == 0)
    {
        self.textView.text = @"Нет данных";
        [self.scrollView addSubview:self.textView];
    }
    [self.scrollView sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight + self.commentsTableView.bounds.size.height);
}

-(void)setDiscussionView
{
    CGRect frame = self.textView.frame;
    frame.size.height += self.view.bounds.size.height;
    self.commentsTableView = [[UITableView alloc]initWithFrame:frame];
    self.commentsTableView.userInteractionEnabled = NO;
    self.commentsTableView.delegate = self;
    self.commentsTableView.dataSource = self;
    self.commentsTableView.frame = CGRectMake(0, textViewFrame.origin.y, textViewFrame.size.width, commentsHeight);
    [self.scrollView addSubview:self.commentsTableView];
}

-(void)addCompanysFeedback
{
    [self cleanTextView];
    [self setFeedbackView];
    if(feedbackCellsArray.count == 0)
    {
        self.textView.text = @"Нет данных";
        [self.scrollView addSubview:self.textView];
    }
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

-(void)setFeedbackView
{
    CGRect frame = textViewFrame;
    frame.size.height += self.view.bounds.size.height/3;
    self.feedBackTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.scrollView.center.x + 0.4 * halfOffset - (textViewFrame.size.width)/2, textViewFrame.origin.y, textViewFrame.size.width, feedbacksHeight)];
    self.feedBackTableView.userInteractionEnabled = YES;
    self.feedBackTableView.delegate = self;
    self.feedBackTableView.dataSource = self;
    [self.scrollView addSubview:self.feedBackTableView];
}

@end
