//
//  MenuSlideSystemController.m
//  Dev
//
//  Created by Mraks on 4/15/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "MSSlideSystemController.h"
#import <QuartzCore/QuartzCore.h>

#define OFFSET_POINT 10
#define ANIMATION_DURATION .25f
#define ANIMATION_LEFT_TAG 0
#define ANIMATION_RIGHT_TAG 1

#define TAP_BUTTON_ANIMATION @"tabButtonAnimation"
#define TAP_SLIDE_ANIMATION_RIGHT @"tapSlideAnimatioRight"
#define TAP_SLIDE_ANIMATION_LEFT @"tapSlideAnimatioLeft"

UIColor* MENU_VIEW_COLOR;
float NAVIGATION_BAR_HEIGHT;
float START_MENUVIEW_POINT;

@interface MSSlideSystemController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>
{
    UIViewController* menuController;
    UIBarButtonItem* leftNavButton;
    CGFloat firstX;
    CGFloat firstY;
    UIView* backgroundMenuView;
    CGFloat previousX;
    BOOL moveRight; 
}

- (void)placeButtonForLeftPanel;
- (void)handlePanGesture:(UIPanGestureRecognizer*)sender;
- (void)addViewController:(UIViewController *)addViewController toViewController:(UIViewController*)viewController withFrame:(CGRect)frame;
- (void)movePanelToRight;
- (void)movePanelBack;
- (void)setPanelOfMenu;
- (void)fleshAnimationWithIdentifier:(NSString *)identifier;

@end

@implementation MSSlideSystemController

@synthesize menuPanel;
@synthesize centralPanel;

- (void)setConstants
{    
    MENU_VIEW_COLOR = [UIColor whiteColor];
    START_MENUVIEW_POINT = OFFSET_POINT - self.view.frame.size.width / 2;
    NAVIGATION_BAR_HEIGHT = self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setConstants];
    
    menuController = [[UIViewController alloc]init];
    [menuController.view setBackgroundColor:[UIColor clearColor]];
    
    [self addViewController:centralPanel toViewController:self withFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self addViewController:menuController toViewController:self withFrame:CGRectMake(START_MENUVIEW_POINT, NAVIGATION_BAR_HEIGHT, self.view.frame.size.width / 2, self.view.frame.size.height - NAVIGATION_BAR_HEIGHT)];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [panGesture setMaximumNumberOfTouches:1];
    [panGesture setMinimumNumberOfTouches:1];
    
    [menuController.view addGestureRecognizer:panGesture];
 
    [self placeButtonForLeftPanel];
    [self setPanelOfMenu];
    
    if ([centralPanel isKindOfClass:[UINavigationController class]])
        ((UINavigationController*)centralPanel).delegate = self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([[touches anyObject] view] == menuController.view && leftNavButton.tag == ANIMATION_RIGHT_TAG)
    {
        [self fleshAnimationWithIdentifier:TAP_BUTTON_ANIMATION];
        [self movePanelBack];
    }
}

- (void)addViewController:(UIViewController *)addViewController toViewController:(UIViewController*)parentViewController withFrame:(CGRect)frame
{    
    [parentViewController addChildViewController:addViewController];
    [parentViewController.view addSubview:addViewController.view];
    [addViewController.view setFrame:frame];
    [addViewController didMoveToParentViewController:parentViewController];
}

-(void)setPanelOfMenu
{   
    [self addViewController:menuPanel toViewController:menuController withFrame:CGRectMake(0, 0, menuController.view.frame.size.width - OFFSET_POINT, menuController.view.frame.size.height)];
    
    backgroundMenuView = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - NAVIGATION_BAR_HEIGHT)];    
    [backgroundMenuView setBackgroundColor:[UIColor blackColor]];
    [backgroundMenuView setAlpha:0.0];
    [centralPanel.view addSubview:backgroundMenuView];
}

- (void)fleshAnimationWithIdentifier:(NSString *)identifier
{
    [UIView beginAnimations:@"flash" context:nil];
    [UIView setAnimationDuration:ANIMATION_DURATION];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (leftNavButton.tag == ANIMATION_LEFT_TAG && [identifier isEqualToString:TAP_BUTTON_ANIMATION])
    {
        [backgroundMenuView setAlpha:0.8];
    } 
    if (leftNavButton.tag == ANIMATION_RIGHT_TAG && [identifier isEqualToString:TAP_BUTTON_ANIMATION])
    {
        [backgroundMenuView setAlpha:0.0];
    }
    if ([identifier isEqualToString:TAP_SLIDE_ANIMATION_LEFT])
    {
        [backgroundMenuView setAlpha:0.0];
    }
    if ([identifier isEqualToString:TAP_SLIDE_ANIMATION_RIGHT])
    {
        [backgroundMenuView setAlpha:0.8];
    }
    [UIView commitAnimations];
}

- (void)menuAction
{
    [self fleshAnimationWithIdentifier:TAP_BUTTON_ANIMATION];
    
    if (leftNavButton.tag == ANIMATION_LEFT_TAG)
    {
        [self movePanelToRight];
    } else
    {
        [self movePanelBack];
    }
}

- (void) movePanelToRight
{
    if ([((UINavigationController*)self.centralPanel).viewControllers count] == 1)
    {
        ((UINavigationController*)self.centralPanel).visibleViewController.navigationItem.leftBarButtonItem = nil;
    }
    [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^
    {
        menuController.view.frame = CGRectMake( 0, NAVIGATION_BAR_HEIGHT, self.view.frame.size.width , self.view.frame.size.height - NAVIGATION_BAR_HEIGHT);
        menuPanel.view.frame = CGRectMake( menuController.view.bounds.origin.x, menuController.view.bounds.origin.y, menuController.view.bounds.size.width / 2 , menuController.view.bounds.size.height);
        
    } completion:^(BOOL finished) {
        if (finished)
        {
            menuPanel.view.frame = CGRectMake( menuController.view.bounds.origin.x, menuController.view.bounds.origin.y, menuController.view.bounds.size.width / 2 , menuController.view.bounds.size.height);
            leftNavButton.tag = ANIMATION_RIGHT_TAG;
        }
    }];
}

- (void) movePanelBack
{
    if ([((UINavigationController*)self.centralPanel).viewControllers count] == 1)
    {
        ((UINavigationController*)self.centralPanel).visibleViewController.navigationItem.leftBarButtonItem = leftNavButton;
    }
    [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^
    {
         menuController.view.frame = CGRectMake(START_MENUVIEW_POINT, NAVIGATION_BAR_HEIGHT, self.view.frame.size.width / 2, self.view.frame.size.height - NAVIGATION_BAR_HEIGHT);
    } completion:^(BOOL finished) {
        if (finished)
        {
            menuPanel.view.frame = CGRectMake(0, 0, menuController.view.frame.size.width - OFFSET_POINT, menuController.view.frame.size.height);
            leftNavButton.tag = ANIMATION_LEFT_TAG;
        }
    }];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([((UINavigationController*)self.centralPanel).viewControllers count] == 1)
    {
        ((UINavigationController*)self.centralPanel).visibleViewController.navigationItem.leftBarButtonItem = leftNavButton;
    }
    if ([((UINavigationController*)centralPanel) respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        ((UINavigationController*)centralPanel).interactivePopGestureRecognizer.enabled = NO;
    }
    if (leftNavButton.tag != ANIMATION_RIGHT_TAG)
    {
        ((UINavigationController*)centralPanel).visibleViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)sender
{
    [self.view bringSubviewToFront:[sender view]];
    CGPoint translatePoint = [sender translationInView:self.view];
    
    if (leftNavButton.tag == ANIMATION_LEFT_TAG && [sender state] == UIGestureRecognizerStateBegan)
    {
        [sender view].frame = CGRectMake(START_MENUVIEW_POINT, NAVIGATION_BAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height - NAVIGATION_BAR_HEIGHT);
        menuPanel.view.frame = CGRectMake( menuController.view.bounds.origin.x, menuController.view.bounds.origin.y, menuController.view.bounds.size.width / 2 , menuController.view.bounds.size.height);
    }
    if ([sender state] == UIGestureRecognizerStateBegan)
    {
        firstX = [[sender view] center].x;
        firstY = [[sender view] center].y;
        previousX = firstX;
    }
    
    translatePoint = CGPointMake(firstX + translatePoint.x, firstY);
    
    if (translatePoint.x >= 0 && translatePoint.x <= self.view.frame.size.width / 2)
    {
        [[sender view] setCenter:translatePoint];
    }
    if ([sender state] == UIGestureRecognizerStateChanged && translatePoint.x >= 0 && translatePoint.x <= self.view.frame.size.width / 2)
    {    
        [UIView beginAnimations:@"flash" context:nil];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        if (translatePoint.x > previousX)
        {
            backgroundMenuView.alpha += abs(translatePoint.x - previousX) * 0.005;
            moveRight = YES;
        } else
        {
            backgroundMenuView.alpha -= abs(translatePoint.x - previousX) * 0.005;
            moveRight = NO;
        }
        [UIView commitAnimations];
    }
    if ([sender state] == UIGestureRecognizerStateEnded)
    {
        CGFloat finalX = translatePoint.x;
        
        if (finalX > firstX && moveRight)
        {
            [self movePanelToRight];
            [self fleshAnimationWithIdentifier:TAP_SLIDE_ANIMATION_RIGHT];
            
        } else
        {
            [self movePanelBack];
            [self fleshAnimationWithIdentifier:TAP_SLIDE_ANIMATION_LEFT];
        }        
    }
    previousX = translatePoint.x;
}

- (void)placeButtonForLeftPanel 
{
    UIViewController *buttonController = self.centralPanel;
    if ([buttonController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *nav = (UINavigationController *)buttonController;
        if ([nav.viewControllers count] > 0) 
        {
            buttonController = [nav.viewControllers objectAtIndex:0];
        }
    }
    if (!buttonController.navigationItem.leftBarButtonItem)
    {   
        leftNavButton = [[UIBarButtonItem alloc]initWithTitle:@"Меню" style:UIBarButtonItemStylePlain target:self action:@selector(menuAction)];
        leftNavButton.tag = ANIMATION_LEFT_TAG;
        buttonController.navigationItem.leftBarButtonItem = leftNavButton;
    }
}

- (void)hideMenu
{
    [self fleshAnimationWithIdentifier:TAP_BUTTON_ANIMATION];
    [self movePanelBack];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end