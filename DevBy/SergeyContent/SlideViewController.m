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

- (UIViewController*) addController
{
    NewsCellViewController* viewController = [[NewsCellViewController alloc]init];
    
//    viewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    return viewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:50.0] forKey:UIPageViewControllerOptionSpineLocationKey]];
    
    pageViewController.dataSource = self;
    pageViewController.delegate = self;

    pageViewController.view.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);
    
    NewsCellViewController* viewController = (NewsCellViewController*)[self addController];
    [viewController.view setTag:currentIndex];
    viewController.label.text = [delegate contentByIndex:currentIndex];
    
    NSArray* viewControllersArray = [NSArray arrayWithObject:viewController];
    [pageViewController setViewControllers:viewControllersArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    [pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = pageViewController.gestureRecognizers;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NewsCellViewController* controller = (NewsCellViewController*)[self addController];

    return controller;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NewsCellViewController* controller = (NewsCellViewController*)[self addController];

    return controller;

}

@end
