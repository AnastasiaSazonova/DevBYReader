//
//  SlideViewController.h
//  Dev
//
//  Created by Mraks on 4/21/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideViewDelegate

- (NSInteger) countForPages;

@end

@interface SlideViewController : UIViewController

@property(nonatomic, strong)id<SlideViewDelegate> delegate;

- (id)initWithIndex:(NSInteger)index;

@end
