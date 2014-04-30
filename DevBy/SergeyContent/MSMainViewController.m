//
//  MainViewController.m
//  Dev
//
//  Created by Mraks on 4/17/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "MSMainViewController.h"
#import "MSSlideSystemController.h"
#import "MenuViewController.h"

#import "NewsViewController.h"
//#import "JobViewController.h"
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
    viewController = [[MSSlideSystemController alloc] init];
     MenuViewController* menuViewController = [[MenuViewController alloc] init];
    menuViewController.menuDelegate = self;
    viewController.menuPanel = menuViewController;

    //put chosen viewController
    viewController.centralPanel = [[UINavigationController alloc] initWithRootViewController:[[PostsViewController alloc] init]];
//    viewController.centralPanel = [[UINavigationController alloc] initWithRootViewController:[[NewsViewController alloc] init]];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)showChosenCategory:(NSString *)chosenViewController
{
    UINavigationController* navigation = (UINavigationController*) viewController.centralPanel;
    if ([viewController.centralPanel isKindOfClass:UINavigationController.class])
    {
        if ([chosenViewController isEqualToString:NEWS])
        {
            if (![navigation.topViewController isKindOfClass:PostsViewController.class])
                [navigation pushViewController:[[PostsViewController alloc]init] animated:YES];
            return;
        } else if ([chosenViewController isEqualToString:COMPANYS])
        {

            if(![navigation.topViewController isKindOfClass:CompaniesViewController.class])
                [navigation pushViewController:[[CompaniesViewController alloc]init] animated:YES];
            return;
        } else if ([chosenViewController isEqualToString:JOB])
        {
            if(![navigation.topViewController isKindOfClass:VacanciesViewController.class])
                [navigation pushViewController:[[VacanciesViewController alloc]init] animated:YES];
            return;
        } else if ([chosenViewController isEqualToString:EVENTS])
        {
            if (![navigation.topViewController isKindOfClass:EventsViewController.class])
                [navigation pushViewController:[[EventsViewController alloc]init] animated:YES];
            return;
        }
    } 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
