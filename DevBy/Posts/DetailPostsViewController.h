//
//  DetailPostsViewController.h
//  DevBYReader
//
//  Created by Anastasia on 4/10/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPostsViewController : UIViewController

- (id)initWithUrl:(NSString*)url;
- (void) startLoadContentByUrl:(NSString*)url;
- (BOOL)isArticleWithData;

@end
