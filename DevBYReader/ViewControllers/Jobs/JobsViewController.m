//
//  JobsViewController.m
//  DevBy
//
//  Created by Admin on 4/9/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "JobsViewController.h"

@interface JobsViewController ()

@end

@implementation JobsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"JOBS";
    label.center = self.view.center;
    [self.view addSubview:label];
}

@end
