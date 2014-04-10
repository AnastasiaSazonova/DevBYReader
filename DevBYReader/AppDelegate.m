//
//  AppDelegate.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftSideTableViewController.h"
#import "PostsViewController.h"
#import "JASidePanelController.h"
#import "SideViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = NO;
    
	self.viewController.leftPanel = [[SideViewController alloc] init];
	self.viewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[PostsViewController alloc] init]];
	
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;

}

@end

