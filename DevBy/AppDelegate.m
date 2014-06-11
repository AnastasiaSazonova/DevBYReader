//
//  AppDelegate.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "AppDelegate.h"
#import "PostsViewController.h"
#import "JASidePanelController.h"
#import "SlideViewController.h"
#import "MSMainViewController.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MSMainViewController* mainController = [[MSMainViewController alloc]init];
    UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:mainController];
    navigationController.navigationBarHidden = YES;
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    return YES;
}

@end

