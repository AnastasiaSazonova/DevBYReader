//
//  MenyViewController.h
//  Dev
//
//  Created by Mraks on 4/29/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate

- (void) showChosenCategory:(NSString*) chosenViewController;

@end

@interface MenuViewController : UIViewController

@property(nonatomic, strong) id<MenuDelegate> menuDelegate;
- (id)initWithFrame:(CGRect)frame;

@end
