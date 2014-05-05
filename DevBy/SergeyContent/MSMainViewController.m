
// MainViewController.m
// Dev //
// Created by Mraks on 4/17/14.
// Copyright (c) 2014 __MyCompanyName__. All rights reserved. //
#import "MSMainViewController.h"
#import "MSSlideSystemController.h"
#import "MenuViewController.h"
#import "NewsViewController.h"
#import "PostsViewController.h" 
#import "CompaniesViewController.h" 
#import "EventsViewController.h" 
#import "VacanciesViewController.h"
#import "Constants.h"

@interface MSMainViewController () <MenuDelegate>
@property(nonatomic, strong) MSSlideSystemController *viewController;
@end
@implementation MSMainViewController
@synthesize viewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //put chosen viewController
    [self initNewCategory:NEWS];
}

- (void) initNewCategory:(NSString*)type
{
    [self.navigationController popToRootViewControllerAnimated:NO];
    viewController = [[MSSlideSystemController alloc] init];
    MenuViewController* menuViewController = [[MenuViewController alloc] init];
    menuViewController.menuDelegate = self;
    viewController.menuPanel = menuViewController;
    if ([type isEqualToString:NEWS]) {
        viewController.centralPanel = [[UINavigationController alloc] initWithRootViewController: [[PostsViewController alloc] init]];
    }
    else if ([type isEqualToString:COMPANYS]) {
        viewController.centralPanel = [[UINavigationController alloc] initWithRootViewController: [[CompaniesViewController alloc] init]];
    }
    else if ([type isEqualToString:JOB]) {
        viewController.centralPanel = [[UINavigationController alloc] initWithRootViewController: [[VacanciesViewController alloc] init]];
    }
    else if ([type isEqualToString:EVENTS]) {
        viewController.centralPanel = [[UINavigationController alloc] initWithRootViewController: [[EventsViewController alloc] init]];
    }
    [self.navigationController pushViewController:viewController animated:YES];
    ((UINavigationController*) viewController.centralPanel).topViewController.navigationItem.titleView = [[UIImageView alloc] initWithImage:[self imageWithImage:[UIImage imageNamed:@"devLogo"] scaledToSize:CGSizeMake(100, 35)]];
}

- (void) showChosenCategory:(NSString*) chosenViewController
{
    [self showChosenCategory:chosenViewController withFlag:NO];
}

- (void)showChosenCategory:(NSString *)chosenViewController withFlag:(BOOL)flag
{
    UINavigationController* navigation = ((UINavigationController*) viewController.centralPanel);
    if(flag)
    {
        if ([viewController.centralPanel isKindOfClass:UINavigationController.class])
        {
            if ([chosenViewController isEqualToString:NEWS] && ![navigation.topViewController isKindOfClass:PostsViewController.class])
            {
                    [navigation pushViewController:[[PostsViewController alloc]init] animated:YES];
            }
            else if ([chosenViewController isEqualToString:COMPANYS] && ![navigation.topViewController isKindOfClass:CompaniesViewController.class])
            {
                    [navigation pushViewController:[[CompaniesViewController alloc]init] animated:YES];
            }
            else if ([chosenViewController isEqualToString:JOB] && ![navigation.topViewController isKindOfClass:VacanciesViewController.class])
            {
                    [navigation pushViewController:[[VacanciesViewController alloc]init] animated:YES];
            }
            else if ([chosenViewController isEqualToString:EVENTS] && ![navigation.topViewController isKindOfClass:EventsViewController.class])
            {
                    [navigation pushViewController:[[EventsViewController alloc]init] animated:YES];
            }
            navigation.topViewController.navigationItem.titleView = [[UIImageView alloc] initWithImage:[self imageWithImage:[UIImage imageNamed:@"devLogo"] scaledToSize:CGSizeMake(100, 35)]];
            [viewController hideMenu];
        }
    }
    else
    {
        [viewController hideMenu];
        if ([chosenViewController isEqualToString:NEWS] && [navigation.topViewController isKindOfClass:PostsViewController.class])
        {
            return;
        }
        else if ([chosenViewController isEqualToString:COMPANYS] && [navigation.topViewController isKindOfClass:CompaniesViewController.class])
        {
            return;
        }
        else if ([chosenViewController isEqualToString:JOB] && [navigation.topViewController isKindOfClass:VacanciesViewController.class])
        {
            return;
        }
        else if ([chosenViewController isEqualToString:EVENTS] && [navigation.topViewController isKindOfClass:EventsViewController.class])
        {
            return;
        }
        [self initNewCategory:chosenViewController];
    }
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)]; UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
    return newImage;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait); }

@end