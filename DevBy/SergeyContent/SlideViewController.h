//
//  SlideViewController.h
//  Dev
//
//  Created by Mraks on 4/21/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlideViewController;

@protocol SlideViewDelegate

- (NSInteger) countForPages;
- (NSString*) urlOfCurrentArticle:(int)index;
- (void) loadContentType:(NSString*)identifier;
- (void) setSlideSystemToNil;

@end

@interface SlideViewController : UIViewController

@property(nonatomic, strong)id<SlideViewDelegate> delegate;

- (id)initWithPageIndex:(int)index;
- (void)reloadContent;

@end
