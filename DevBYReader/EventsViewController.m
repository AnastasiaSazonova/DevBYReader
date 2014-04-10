//
//  EventsViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/9/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "EventsViewController.h"

@implementation EventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Dev.by", nil);
    [self showAlert];
}

- (void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Events" message:@"Comming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
