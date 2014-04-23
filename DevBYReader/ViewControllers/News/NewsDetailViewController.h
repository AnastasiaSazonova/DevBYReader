//
//  NewsDetailViewController.h
//  DevBy
//
//  Created by Admin on 4/10/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsRepository.h"
#import "NewsDetailModel.h"
#import "Constants.h"

@interface NewsDetailViewController : UIViewController<UIWebViewDelegate>

- (id)initWithNewsId:(NSInteger)newsId_;

@end
