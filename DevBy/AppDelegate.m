//
//  AppDelegate.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AppDelegate.h"
#import "PostsViewController.h"
#import "SlideViewController.h"
#import "MSMainViewController.h"
#import "HTMLParser.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024
                                                         diskCapacity:20 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MSMainViewController* mainController = [[MSMainViewController alloc]init];
    UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:mainController];
    navigationController.navigationBarHidden = YES;
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    [HTMLParser sharedInstance];
    
    return YES;
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.viewController = [[JASidePanelController alloc] init];
//    self.viewController.shouldDelegateAutorotateToVisiblePanel = NO;
//    
//	self.viewController.leftPanel = [[SideViewController alloc] init];
//	self.viewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[PostsViewController alloc] init]];
//	
//	self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];
//    return YES;

}


@end

