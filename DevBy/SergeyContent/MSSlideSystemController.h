//
//  MenuSlideSystemController.h
//  Dev
//
//  Created by Mraks on 4/15/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSSlideSystemController : UIViewController

@property(nonatomic, strong)UIViewController* menuPanel;
@property(nonatomic, strong)UIViewController* centralPanel;

- (void)hideMenu;

@end
