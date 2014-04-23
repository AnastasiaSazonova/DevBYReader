//
//  AppDelegate.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = NO;
    
	self.viewController.leftPanel = [[MenuViewController alloc] init];
	self.viewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:newsViewController];
	self.window.rootViewController = self.viewController;
    
    return YES;
}
@end

