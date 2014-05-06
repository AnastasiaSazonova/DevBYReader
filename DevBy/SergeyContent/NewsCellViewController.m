//
//  NewsCellViewController.m
//  Dev
//
//  Created by Mraks on 4/17/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "NewsCellViewController.h"

@implementation NewsCellViewController
{
    NSString* contentText;
}
@synthesize label;

- (id)initWithText:(NSString*)text
{
    self = [super init];
    if (self)
    {
        contentText = text;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, 100, 200);
    [self.view setBackgroundColor:[UIColor greenColor]];
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 45)];
    [label setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:label];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
