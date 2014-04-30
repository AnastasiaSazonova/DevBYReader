//
//  MenuTableViewController.h
//  Dev
//
//  Created by Mraks on 4/15/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate

- (void) showChosenCategory:(NSString*) chosenViewController;

@end

@interface MenuTableViewController : UITableViewController

@property(nonatomic, strong) id<MenuDelegate> menuDelegate;

@end
