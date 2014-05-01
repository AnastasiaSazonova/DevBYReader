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

#import "DetailPostsViewController.h"

@interface SlideViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property(nonatomic, strong) UIPageViewController* pageViewController;
@property(nonatomic,strong) NSArray* contentArray; 

@end

@implementation SlideViewController
{
    NSInteger currentIndex;
    NSMutableArray * array;
}

@synthesize delegate;
@synthesize pageViewController;
@synthesize contentArray;

- (id)initWithIndex:(NSInteger)index
{
    self = [super init];
    if (self) 
    {
        currentIndex = index;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    array = [[NSMutableArray alloc] init];
    [self fillArrayWith:@"Full-stack разработчики: Программисты, понимающие весь стек, обычно создают более качественные приложения." andImage:[UIImage imageNamed:@"devImage"]];
    [self fillArrayWith:@"Heartbleed – новое слово в маркетинге багов." andImage:[UIImage imageNamed:@"devImage3"]];
    [self fillArrayWith:@"Злой гений создал гибрид '2048' и 'Flappy Bird' на погибель вашей продуктивности." andImage:[UIImage imageNamed:@"devImage3"]];
    [self fillArrayWith:@"Сегодня в 18:00 начнется прямая трансляция церемонии награждения Belarusian IT Awards и Best IT Companies." andImage:[UIImage imageNamed:@"devImage3"]];
    
    [self addArticleNumber: currentIndex + 1];

    pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:50.0] forKey:UIPageViewControllerOptionSpineLocationKey]];
    
    pageViewController.dataSource = self;
    pageViewController.delegate = self;

    pageViewController.view.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);

    DetailPostsViewController * detailViewController1 = array[currentIndex];
    
    NSArray* viewControllersArray = @[detailViewController1];
    [pageViewController setViewControllers:viewControllersArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    [pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = pageViewController.gestureRecognizers;
}

-(void)fillArrayWith:(NSString *)title andImage:(UIImage *)image
{
    DetailPostsViewController * detail = [[DetailPostsViewController alloc] init];
    detail.title = title;
    detail.image = image;
    detail.view.backgroundColor = [UIColor whiteColor];
    [array addObject:detail];
}

-(void)addArticleNumber:(int)number
{
    UILabel * numberOfArticle = [[UILabel alloc] init];
    numberOfArticle.font = [UIFont boldSystemFontOfSize:12];
    numberOfArticle.textColor = [UIColor grayColor];
    numberOfArticle.numberOfLines = 2;
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

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    DetailPostsViewController * controller = (DetailPostsViewController *)viewController;
    int index = [array indexOfObject:controller];
    
    if(index == 0)
    {
        return nil;
    }
    index--;
    
   // [self addArticleNumber: index];
    DetailPostsViewController * detailViewController = array[index];
    return detailViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    DetailPostsViewController * controller = (DetailPostsViewController *)viewController;
    int index = [array indexOfObject:controller];
    
    if (index == [delegate countForPages] - 1)
    {
        [self addArticleNumber: index + 1];
        return nil;
    }
    index++;
    DetailPostsViewController * detailViewController = array[index];
    [self addArticleNumber: index];
    return detailViewController;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    DetailPostsViewController * controller = (DetailPostsViewController *)pendingViewControllers[0];
    int index = [array indexOfObject:controller] + 1;
    [self addArticleNumber: index];
}


@end
