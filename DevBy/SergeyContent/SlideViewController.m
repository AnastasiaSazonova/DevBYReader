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

    pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:50.0] forKey:UIPageViewControllerOptionSpineLocationKey]];
    
    pageViewController.dataSource = self;
    pageViewController.delegate = self;

    pageViewController.view.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);
    
    
    DetailPostsViewController * detailViewController = [[DetailPostsViewController alloc] init];
    
    NSArray* viewControllersArray = [NSArray arrayWithObject:detailViewController];
    [pageViewController setViewControllers:viewControllersArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    [pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = pageViewController.gestureRecognizers;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    currentIndex--;
    if(currentIndex <= 0)
    {
        return nil;
    }
    DetailPostsViewController * detailViewController = [[DetailPostsViewController alloc] init];
    detailViewController.view.frame = self.pageViewController.view.bounds;
    return detailViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    currentIndex++;

    if (currentIndex >= [delegate countForPages])
    {
        return nil;
    }

    DetailPostsViewController * detailViewController = [[DetailPostsViewController alloc] init];
    detailViewController.view.frame = self.pageViewController.view.bounds;
    return detailViewController;
}

@end
