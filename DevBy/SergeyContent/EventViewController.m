//
//  EventViewController.m
//  Dev
//
//  Created by Mraks on 4/17/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"

@implementation EventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    UITextField* field = [[UITextField alloc]initWithFrame:self.view.frame];
    field.textAlignment = UITextAlignmentCenter;
    field.text = @"EVENT";
    [self.view addSubview:field];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
