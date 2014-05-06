//
//  JobViewController.m
//  Dev
//
//  Created by Mraks on 4/17/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "JobViewController.h"

@implementation JobViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITextField* field = [[UITextField alloc]initWithFrame:self.view.frame];
    field.textAlignment = UITextAlignmentCenter;
    field.text = @"JOB";
    [self.view addSubview:field];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
