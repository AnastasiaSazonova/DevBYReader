//
//  SideViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/10/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "SideViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "PostsViewController.h"
#import "CompaniesViewController.h"
#import "VacanciesViewController.h"
#import "EventsViewController.h"

NSString * menuStr = @"Dev.by";
NSString * mainStr = @"Главная";
NSString * companiesStr = @"Компании";
NSString * vacanciesStr = @"Вакансии";
NSString * eventsStr = @"События";

enum
{
  kMainButton,
  kCompaniesButton,
  kVacanciesButton,
  kEventsButton
};

@implementation SideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	UILabel *label  = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    label.textColor = [UIColor blueColor];
    label.backgroundColor = [UIColor clearColor];
	label.text = menuStr;
    label.frame = CGRectMake(94.0f, 30.0f, 200.0f, 40.0f);
	[label sizeToFit];
	label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 70.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:mainStr forState:UIControlStateNormal];
    button.tag = kMainButton;
    [button addTarget:self action:@selector(_changeCenterPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 120.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:companiesStr forState:UIControlStateNormal];
    button.tag = kCompaniesButton;
    [button addTarget:self action:@selector(_changeCenterPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 170.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:vacanciesStr forState:UIControlStateNormal];
    button.tag = kVacanciesButton;
    [button addTarget:self action:@selector(_changeCenterPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
        
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 220.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:eventsStr forState:UIControlStateNormal];
    button.tag = kEventsButton;
    [button addTarget:self action:@selector(_changeCenterPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - Button Actions

- (void)_changeCenterPanelTapped:(UIButton*)sender
{
    switch (sender.tag)
    {
        case 0:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[PostsViewController alloc] init]];
            break;
        case 1:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[CompaniesViewController alloc] init]];
            break;
        case 2:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[VacanciesViewController alloc] init]];
            break;
        case 3:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[EventsViewController alloc] init]];
            break;
        default:
            break;
    }
}

@end
