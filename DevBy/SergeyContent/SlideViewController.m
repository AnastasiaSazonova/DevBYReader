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
    [self fillArrayWith:@"Post 1" andImage:[UIImage imageNamed:@"devImage"]];
    [self fillArrayWith:@"Post 2" andImage:[UIImage imageNamed:@"devImage2"]];
    [self fillArrayWith:@"Post 3" andImage:[UIImage imageNamed:@"devImage3"]];
    [self fillArrayWith:@"Post 4" andImage:[UIImage imageNamed:@"devImage2"]];
    NSLog(@"array %@", array);
    pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:50.0] forKey:UIPageViewControllerOptionSpineLocationKey]];
    
    pageViewController.dataSource = self;
    pageViewController.delegate = self;

    pageViewController.view.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);

    DetailPostsViewController * detailViewController1 = array[currentIndex];
    self.navigationItem.title = [NSString stringWithFormat:@"%d/%d", currentIndex + 1, [delegate countForPages]];
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

    NSLog(@"%@", self.pageViewController.viewControllers);
    NSLog(@"index %d", index);
    index -= 1;
    self.navigationItem.title = [NSString stringWithFormat:@"%d/%d", index + 1, [delegate countForPages]];
    
    DetailPostsViewController * detailViewController = array[index];
    return detailViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    DetailPostsViewController * controller = (DetailPostsViewController *)viewController;
    int index = [array indexOfObject:controller];
    //NSLog(@"1   %d",index);
    if (index == [delegate countForPages] - 1)
    {
        self.navigationItem.title = [NSString stringWithFormat:@"%d/%d", index + 1 , [delegate countForPages]];
        return nil;
    }
    index += 1;
    DetailPostsViewController * detailViewController = array[index];
    self.navigationItem.title = [NSString stringWithFormat:@"%d/%d", index , [delegate countForPages]];
    return detailViewController;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{

}


@end
