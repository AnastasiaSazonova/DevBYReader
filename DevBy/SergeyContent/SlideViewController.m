//
//  SlideViewController.m
//  Dev
//
//  Created by Mraks on 4/21/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SlideViewController.h"
#import "NewsCellViewController.h"
#import "MainArticleCell.h"
#import "ArticleCell.h"
#import "Constants.h"

#import "DetailPostsViewController.h"
#import "HTMLParser.h"

@interface SlideViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property(nonatomic, strong) UIPageViewController* pageViewController;

@end

@implementation SlideViewController
{
    NSInteger currentIndex;
    NSMutableArray * contentArray;
}

@synthesize delegate;
@synthesize pageViewController;


- (id)initWithPageIndex:(int)index
{
    self = [super init];
    if (self) {
        currentIndex = index;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    contentArray = [[NSMutableArray alloc] init];
    
    int count = [delegate countForPages];
    for(int i = 0; i < count; i++)
    {
        DetailPostsViewController * detail = [[DetailPostsViewController alloc]initWithUrl:nil];
        [detail.view setBackgroundColor:[UIColor whiteColor]];
        [contentArray addObject:detail];
    }
    
    [self addArticleNumber];
    
    pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:50.0] forKey:UIPageViewControllerOptionSpineLocationKey]];
    
    pageViewController.dataSource = self;
    pageViewController.delegate = self;
    
    pageViewController.view.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);
    
    DetailPostsViewController * detailViewController = [contentArray objectAtIndex:currentIndex];
    
    if(!detailViewController.isArticleWithData)
    {
        [detailViewController startLoadContentByUrl:[delegate urlOfCurrentArticle:currentIndex]];
    }
    
    [contentArray replaceObjectAtIndex:currentIndex withObject:detailViewController];
    
    NSArray* viewControllersArray = @[detailViewController];
    
    [pageViewController setViewControllers:viewControllersArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    [pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = pageViewController.gestureRecognizers;
}

-(void)addArticleNumber
{
    UILabel * numberOfArticle = [[UILabel alloc] init];
    numberOfArticle.font = [UIFont boldSystemFontOfSize:12];
    numberOfArticle.textColor = [UIColor grayColor];
    numberOfArticle.numberOfLines = 2;
    int number = currentIndex + 1;
    if (number < 10)
    {
        numberOfArticle.text = [NSString stringWithFormat:@"Новость \n  %d из %d", number, [delegate countForPages]];;
    }
    else
    {
        numberOfArticle.text = [NSString stringWithFormat:@"Новость \n %d из %d", number, [delegate countForPages]];;
    }
    [numberOfArticle sizeToFit];
    self.navigationItem.titleView = numberOfArticle;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)reloadContent
{
    if([contentArray count] == [delegate countForPages])
        return;
    
    [self addArticleNumber];
    int count = [delegate countForPages] - [contentArray count];
    for(int i = 0; i < count; i++)
    {
        DetailPostsViewController * detail = [[DetailPostsViewController alloc]initWithUrl:nil];
        [detail.view setBackgroundColor:[UIColor whiteColor]];
        [contentArray addObject:detail];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    HTMLParser* parser = [HTMLParser sharedInstance];
    [parser finishParse];
    
    DetailPostsViewController* controller = (DetailPostsViewController *)viewController;
    int index = [contentArray indexOfObject:controller];
    
    if(index == 0)
    {
        [delegate loadContentType:MOVE_RIGHT];
        return nil;
    }
    index--;
    
    DetailPostsViewController * detailViewController = contentArray[index];
    return detailViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    HTMLParser* parser = [HTMLParser sharedInstance];
    [parser finishParse];
    
    DetailPostsViewController * controller = (DetailPostsViewController *)viewController;
    int index = [contentArray indexOfObject:controller];
    
    if (index == [delegate countForPages] - 1)
    {
        [delegate loadContentType:MOVE_LEFT];
        return nil;
    }
    index++;
    
    DetailPostsViewController* detailViewController = [contentArray objectAtIndex:index];
    return detailViewController;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    DetailPostsViewController * controller = (DetailPostsViewController *)pendingViewControllers[0];
    currentIndex = [contentArray indexOfObject:controller];
    [self addArticleNumber];
    [controller startLoadContentByUrl:[delegate urlOfCurrentArticle:currentIndex]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [delegate setSlideSystemToNil];
}

@end
