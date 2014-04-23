/*
 Copyright (c) 2012 Jesse Andersen. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */


#import "MenuViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "NewsViewController.h"
#import "EventsViewController.h"
#import "JobsViewController.h"
#import "CompaniesViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 70.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"Новости" forState:UIControlStateNormal];
    button.tag = NewsSection;
    [button addTarget:self action:@selector(gotoSection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 120.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"События" forState:UIControlStateNormal];
    button.tag = EventsSection;
    [button addTarget:self action:@selector(gotoSection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 170.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"Вакансии" forState:UIControlStateNormal];
    button.tag = JobsSection;
    [button addTarget:self action:@selector(gotoSection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 220.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"Компании" forState:UIControlStateNormal];
    button.tag = CompaniesSection;
    [button addTarget:self action:@selector(gotoSection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - Button Actions

- (void)gotoSection:(UIButton *)sender {
    switch (sender.tag) {
        case NewsSection:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[NewsViewController alloc] init]];
            break;
        case EventsSection:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[EventsViewController alloc] init]];
            break;
        case JobsSection:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[JobsViewController alloc] init]];
            break;
        case CompaniesSection:
            self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[CompaniesViewController alloc] init]];
            break;
        default:
            break;
    }    
}

@end
