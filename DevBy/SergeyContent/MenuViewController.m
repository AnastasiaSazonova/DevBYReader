//
//  MenyViewController.m
//  Dev
//
//  Created by Mraks on 4/29/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "Constants.h"

@interface MenuViewController ()

- (void)createButton:(UIButton*)button WithFrame:(CGRect)frame andTitle:(NSString*)title;
- (void) buttonAction:(UIButton*)button;

@end

@implementation MenuViewController
{
    UIButton* newsButton;
    UIButton* companysButton;
    UIButton* salaryButton;
    UIButton* jobButton;
    UIButton* eventButton;
    CGRect viewFrame;
}

@synthesize menuDelegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        viewFrame = frame;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@   %@",NSStringFromCGRect(self.view.frame),NSStringFromCGRect(self.view.bounds));
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 70, 100, 35) andTitle:NEWS];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 130, 100, 35) andTitle:COMPANYS];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 190, 100, 35) andTitle:JOB];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 250, 100, 35) andTitle:EVENTS];
}

- (void)createButton:(UIButton*)button WithFrame:(CGRect)buttonFrame andTitle:(NSString*)title
{
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = buttonFrame;
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonAction:(UIButton*)button
{
    [menuDelegate showChosenCategory:button.titleLabel.text];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
