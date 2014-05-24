//
//  DetailNewsViewController.m
//  DevBy
//
//  Created by Anastasia on 5/24/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailNewsViewController.h"
#import "CommentsViewController.h"
#import "Constants.h"
#import "HTMLParser.h"
#import "TTTAttributedLabel.h"

@interface DetailNewsViewController () <HTMLParserDelegate, TTTAttributedLabelDelegate, UIActionSheetDelegate>
{
    NSString* articleCellurl;
    HTMLParser* parse;
    BOOL isArticleWithData;
    int counter;
    UIScrollView * scrollView;
    UILabel *label;
    UITextView * titleView;
    UIButton * commentsButton;
    UILabel * dateLabel;
    UIImageView * imageView;
    UITextView * textView;
    UIActivityIndicatorView * activityIndicator;
    TTTAttributedLabel * tttLabel;
    NSString * title;
    NSString * numberOfComments;
    NSString * postedDate;
}
@property(nonatomic, assign)float totalHeight;

@property(nonatomic, strong)NSString * text;
@property(nonatomic, strong)NSString * imageURL;

@end

@implementation DetailNewsViewController

- (id)initWithUrl:(NSString*)url date:(NSString*)date
{
    self = [super init];
    if (self) {
        postedDate = date;
        [self startLoadContentByUrl:url];
    }
    return self;
}

- (void) startLoadContentByUrl:(NSString*)url
{
    if(url)
    {
        articleCellurl = url;
        parse = [HTMLParser sharedInstance];
        [parse startParseFromUrl:articleCellurl andXPath:NEWS_TEXT_XPATH];
        parse.delegate = self;
        isArticleWithData = YES;
    } else
    {
        isArticleWithData = NO;
    }
}

- (BOOL)isArticleWithData
{
    return isArticleWithData;
}

-(void)parseData:(NSDictionary *)dataDictionary WithUrl:(NSString *)url andXPath:(NSString *)xpath
{
    if([articleCellurl isEqualToString:url] && [xpath isEqualToString:NEWS_TEXT_XPATH])
    {
        NSLog(@"%@", dataDictionary);
        
        counter++;
        
        if (counter > 1)
            
            return;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSArray * keys = [dataDictionary allKeys];
            NSLog(@"data %@", dataDictionary);
            for (id key in keys)
            {
                NSArray * elements = dataDictionary[key];
                NSString * currentString = @"";
                for(NSDictionary* dictionary in elements)
                    
                {
                    if([[dictionary.allKeys firstObject] rangeOfString:@"h1/text"].location != NSNotFound)
                    {
                        title = [[dictionary.allValues firstObject]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    }
                    else if([[dictionary.allKeys firstObject] rangeOfString:@"h3"].location != NSNotFound
                            && [[dictionary.allKeys firstObject] rangeOfString:@"strong/text"].location != NSNotFound)
                    {
                        currentString = [self trimLeadingOffset:[dictionary.allValues firstObject]];
                        self.text = [self.text stringByAppendingString:currentString];
                    }
                    else if([[dictionary.allKeys firstObject] rangeOfString:@"img"].location != NSNotFound)
                    {
                        if (!self.imageURL)
                        {
                           // self.imageURL = [dictionary.allValues firstObject];
                        }
                    }
                    else if([[dictionary.allKeys firstObject] isEqualToString:@"time/text"])
                    {
                        postedDate = [dictionary.allValues firstObject];
                    }
                    else if([[dictionary.allKeys firstObject] isEqualToString:@"li/a/link_sentence"])
                    {
                        currentString = [self trimLeadingOffset:[dictionary.allValues firstObject]];
                        self.text = [self.text stringByAppendingString:currentString];
                    }
                    else if([[dictionary.allKeys firstObject] isEqualToString:@"a/blank_description"])
                    {
                        currentString = [self trimLeadingOffset:[dictionary.allValues firstObject]];
                        self.text = [self.text stringByAppendingString:currentString];
                    }
                    else if([[dictionary.allKeys firstObject] rangeOfString:@"text"].location != NSNotFound)
                    {
                        if (![[dictionary.allValues firstObject] isEqualToString:@"\n"])
                        {
                            currentString = [self trimLeadingOffset:[dictionary.allValues firstObject]];
                            if ([currentString rangeOfString:@"Теги"].location == NSNotFound)
                            {
                                self.text = [self.text stringByAppendingString:currentString];
                            }
                        }
                    }
                }
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"updateUI" object:self];
                
            });
            
        });
    }
}

-(NSString *)text
{
    if (!_text)
    {
        _text = @"";
    }
    return _text;
}

-(NSString *)imageURL
{
    if(!_imageURL)
        _imageURL = nil;
    return _imageURL;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    counter = 0;
    
    numberOfComments = @"";
    postedDate = @"";
    title = @"";
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2 - 50);
    CGAffineTransform transform = CGAffineTransformMakeScale(1.5f, 1.5f);
    activityIndicator.transform = transform;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI) name:@"updateUI" object:nil];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
}

-(NSString *)trimLeadingOffset:(NSString *)tempStr
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\n+" options:0 error:NULL];
    NSString *newString = [regex stringByReplacingMatchesInString:tempStr options:0 range:NSMakeRange(0, [tempStr length]) withTemplate:@"\n  "];
    return newString;
}

-(void)updateUI
{
    [activityIndicator stopAnimating];
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    self.totalHeight = navObjectsHeight;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.showsVerticalScrollIndicator = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (title)
    {
        titleView = [[UITextView alloc] initWithFrame:CGRectMake(halfOffset * 0.3, 64, self.view.bounds.size.width - 0.6 *halfOffset, 0)];
        titleView.text = title;
        titleView.font = [UIFont boldSystemFontOfSize:18];
        titleView.userInteractionEnabled = NO;
        [titleView sizeToFit];
        [scrollView addSubview:titleView];
        self.totalHeight += titleView.bounds.size.height;
    }
    if (postedDate)
    {
        CGRect dateLabelRect = CGRectMake(halfOffset, self.totalHeight, 10, 10);
        dateLabel = [[UILabel alloc]initWithFrame:dateLabelRect];
        dateLabel.textColor = [UIColor darkGrayColor];
        dateLabel.font = [UIFont systemFontOfSize:12];
        dateLabel.text = postedDate;
        [dateLabel sizeToFit];
        [scrollView addSubview:dateLabel];
    }
    
    self.totalHeight += dateLabel.bounds.size.height;
//    
//        float imageHeight = 200.0f;
//        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.totalHeight - 64, self.view.bounds.size.width, imageHeight)];
//    
//        NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURL]];
//        UIImage * image = [UIImage imageWithData:imageData];
//        imageView.image = image;
//        [scrollView addSubview:imageView];
//        self.totalHeight += imageView.bounds.size.height;
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(offset * 0.3, self.totalHeight + navObjectsHeight, self.view.bounds.size.width - 0.6 * halfOffset, 0)];
    
    textView.text = [NSString stringWithFormat:@"\t%@", self.text];
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor darkGrayColor];
    textView.userInteractionEnabled = NO;
    
    CGFloat height = [self textViewHeightForAttributedText:textView.attributedText andWidth:textView.frame.size.width];
    
    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y - 64, textView.frame.size.width, height);
    [scrollView addSubview:textView];
    [textView sizeToFit];
    self.totalHeight += textView.frame.size.height;
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.totalHeight);
    [self.view addSubview:scrollView];
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textview = [[UITextView alloc] init];
    [textview setAttributedText:text];
    CGSize size = [textview sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

-(void)touchCommentsButton:(UIButton *)sender
{
    CommentsViewController * commentsViewController = [[CommentsViewController alloc] init];
    [self.navigationController pushViewController:commentsViewController animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [scrollView removeFromSuperview];
    
    if (![[self.navigationController viewControllers] containsObject:self])
    {
        [parse finishParse];
    }
}

#pragma mark - TTTAttributedLabelDelegate

- (void)attributedLabel:(__unused TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    [[[UIActionSheet alloc] initWithTitle:[url absoluteString] delegate:self cancelButtonTitle:NSLocalizedString(@"Отмена", nil) destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Открыть в Safari", nil), nil] showInView:self.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex)
    {
        return;
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:actionSheet.title]];
}

@end