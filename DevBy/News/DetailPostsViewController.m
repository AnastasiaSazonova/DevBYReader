//
//  DetailPostsViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/10/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailPostsViewController.h"
#import "CommentsViewController.h"

@interface DetailPostsViewController ()

@end

@implementation DetailPostsViewController

-(NSString *)text
{
    if (!_text)
    {
        _text = @"The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 loper struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 struggling with status bars.";
    }
    return _text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/2, navObjectsHeight)];
    label.numberOfLines = 2;
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Новости\n 1 из 10";
    self.navigationItem.titleView = label;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.showsVerticalScrollIndicator = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    float textOffset = 20.0f;
    UITextView * titleView = [[UITextView alloc] initWithFrame:CGRectMake(textOffset, navObjectsHeight, self.view.bounds.size.width - 2 *textOffset, 0)];
    titleView.text = [NSString stringWithFormat:@"%@", self.title];
    titleView.font = [UIFont systemFontOfSize:20];
    titleView.userInteractionEnabled = NO;
    [titleView sizeToFit];
    float titleViewHeight = titleView.bounds.size.height;
    [scrollView addSubview:titleView];
    
    float imageHeight = 150.0f;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, navObjectsHeight + titleViewHeight, self.view.bounds.size.width, imageHeight)];
    imageView.backgroundColor = [UIColor grayColor];
    float imageviewHeight = imageView.bounds.size.height;
    [scrollView addSubview:imageView];
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(textOffset, titleViewHeight + imageviewHeight + navObjectsHeight, self.view.bounds.size.width - 2 * textOffset, 0)];
    textView.text = [NSString stringWithFormat:@"\t%@", self.text];
    textView.font = [UIFont systemFontOfSize:14];
    textView.userInteractionEnabled = NO;
    [scrollView addSubview:textView];
    [textView sizeToFit];
    float textViewHeight = textView.bounds.size.height;
    
    UIButton * commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentsButton setTitle:@"Comments(20)" forState:UIControlStateNormal];
    [commentsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    commentsButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [commentsButton sizeToFit];
    [commentsButton addTarget:self action:@selector(touchCommentsButton:) forControlEvents:UIControlEventTouchUpInside];
    commentsButton.frame = CGRectMake(textOffset, titleViewHeight + imageviewHeight + navObjectsHeight + textView.bounds.size.height + textOffset/2, commentsButton.bounds.size.width, commentsButton.bounds.size.height);
    float commentsButtonHeight = commentsButton.bounds.size.height;
    [scrollView addSubview:commentsButton];
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, titleViewHeight + imageviewHeight + textViewHeight + commentsButtonHeight + 4.5 * textOffset);
    [self.view addSubview:scrollView];
}

-(void)touchCommentsButton:(UIButton *)sender
{
    CommentsViewController * commentsViewController = [[CommentsViewController alloc] init];
    [self.navigationController pushViewController:commentsViewController animated:YES];
}

@end
