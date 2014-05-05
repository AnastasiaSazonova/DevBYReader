//
//  SideViewController.h
//  DevBYReader
//
//  Created by Anastasia on 4/10/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideViewController : UIViewController

@property (nonatomic, weak, readonly) UILabel *label;
@property (nonatomic, weak, readonly) UIButton *hide;
@property (nonatomic, weak, readonly) UIButton *show;
@property (nonatomic, weak, readonly) UIButton *removeRightPanel;
@property (nonatomic, weak, readonly) UIButton *addRightPanel;
@property (nonatomic, weak, readonly) UIButton *changeCenterPanel;

@end
