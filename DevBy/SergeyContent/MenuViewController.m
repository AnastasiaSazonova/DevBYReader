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

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)]; UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
    return newImage;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    UIImageView* logoImageView =  [[UIImageView alloc] initWithImage:[self imageWithImage:[UIImage imageNamed:@"devLogo"] scaledToSize:CGSizeMake(100, 35)]];
    logoImageView.frame = CGRectMake(self.view.bounds.size.width / 4 - 50, 10, 100, 35);
    [self.view addSubview:logoImageView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 70, 100, 35) andTitle:POSTS];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 130, 100, 35) andTitle:NEWS];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 190, 100, 35) andTitle:COMPANYS];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 250, 100, 35) andTitle:JOB];
    [self createButton:newsButton WithFrame:CGRectMake(self.view.bounds.size.width / 4 - 50, 310, 100, 35) andTitle:EVENTS];
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
