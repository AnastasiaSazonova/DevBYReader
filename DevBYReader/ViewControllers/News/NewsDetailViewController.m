//
//  NewsDetailViewController.m
//  DevBy
//
//  Created by Admin on 4/10/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()
{
    NewsRepository *newsRepository;
    
    UILabel *titleLabel;
    UILabel *timeLabel;
    UIWebView *descriptionWebView;
    UIView *viewContainer;
    UIScrollView *scrollView;
}
- (void)showTheNewsWithId:(NSInteger)newsId_;

@end

@implementation NewsDetailViewController

- (id)initWithNewsId:(NSInteger)newsId_
{
    self = [super init];
    if (self) {
        newsRepository = [[NewsRepository alloc] init];
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self showTheNewsWithId:newsId_];
    }
    return self;
}

- (void)showTheNewsWithId:(NSInteger)newsId_
{
    NewsDetailModel *model = [newsRepository getNewsDetailModel:newsId_];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view removeConstraints:self.view.constraints];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, self.view.frame.size.width - 30, 40)];
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.text = model.time;
    //timeLabel.backgroundColor = [UIColor blueColor];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, self.view.frame.size.width - 20, 200)];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.text = model.title;
    [titleLabel sizeToFit];
    //titleLabel.backgroundColor = [UIColor yellowColor];
    
    descriptionWebView = [[UIWebView alloc] initWithFrame:CGRectMake(5, titleLabel.frame.size.height + 60 + 10, self.view.frame.size.width - 10, 1)];
    [descriptionWebView loadHTMLString:model.description baseURL:nil];
    descriptionWebView.delegate = self;
    
    viewContainer = [[UIView alloc] init];
    //viewContainer.frame = CGRectMake(0, 0, self.view.frame.size.width, 1);
    //viewContainer.backgroundColor = [UIColor greenColor];
    [viewContainer addSubview:titleLabel];
    [viewContainer addSubview:timeLabel];
    [viewContainer addSubview:descriptionWebView];
    [scrollView addSubview:viewContainer];
    [viewContainer sizeToFit];
    
    [self.view addSubview:scrollView];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGSize webViewTextSize = [webView sizeThatFits:CGSizeMake(1.0, 1.0)];
    CGRect webViewFrame = webView.frame;
    
    webViewFrame.size.height = webViewTextSize.height;
    webView.frame = webViewFrame;
    
    for(id subview in webView.subviews)
       if([[subview class] isSubclassOfClass:[UIScrollView class]])
          [subview setBounces:NO];
    
    CGFloat pageHeight = viewContainer.frame.origin.y + webViewTextSize.height;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, pageHeight + 200);
}


@end
