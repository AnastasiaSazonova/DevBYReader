//
//  DetailPostsViewController.m
//  DevBYReader
//
//  Created by Anastasia on 4/10/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "DetailPostsViewController.h"
#import "CommentsViewController.h"
#import "Constants.h"

@interface DetailPostsViewController ()

@property(nonatomic, assign)float totalHeight;

@end

@implementation DetailPostsViewController

-(NSString *)text
{
    if (!_text)
    {
        _text = @"The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 loper struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 struggling with status bars The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 loper struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 struggling with status bars The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 loper struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 struggling with status bars The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 loper struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 struggling with status bars The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 loper struggling with status bars and view controller containment on iOS 7. The API documentation is woefully inadequate as of this writing. The following is, to the best of my knowledge, essential information for any developer struggling with status bars and view controller containment on iOS 7 struggling with status bars uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue uurhfjjhkjf uehrgiuhseriugh ieurhgiurehiguhseriugh sdiurghiuershgiuesrhgi esirhfiuerhguhesrigs iseuruhgiersguhserighesri iuerhgiuserhsguihesruighiseurhgiusdrh isuerhgiuserhguheriughiseruhgiuserghseuirghsiue врамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщ врамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщврамиловатмотывлоамтова вгармолывтлопткколптоык вгаптшгыватовытпаоптлоыва гвккопщшукоыпшщоыщшопщшвк пшвыкоыпщшыуокшщпощышукпо ыщпощыукопщыуощкопуышщ ыкопшщыукопшщыукошщпоыукшщо щшукоопщыушкопщшкоп куопщшуыкопщшыуопщшквыпоыущ ыущшкопщшыкоушыщпоыщукшпощукш щщушкопщшыкопщуыкшщопуыозпшщукоз щкуыопщыщпрзыущкшпо ыущзкпрзщуыкопщзыоущшкопщзыушкопщ";
    }
    return _text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float navObjectsHeight = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    self.totalHeight = navObjectsHeight;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/2, navObjectsHeight)];
    label.numberOfLines = 2;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"Новости\n1 из 10";
    self.navigationItem.titleView = label;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.showsVerticalScrollIndicator = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITextView * titleView = [[UITextView alloc] initWithFrame:CGRectMake(halfOffset * 0.3, navObjectsHeight, self.view.bounds.size.width - 0.6 *halfOffset, 0)];
    titleView.text = [NSString stringWithFormat:@"%@", self.title];
    titleView.font = [UIFont boldSystemFontOfSize:18];
    titleView.userInteractionEnabled = NO;
    [titleView sizeToFit];
    [scrollView addSubview:titleView];
    self.totalHeight += titleView.bounds.size.height;
    
    UIButton * commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentsButton setTitle:@"10 комментариев" forState:UIControlStateNormal];
    [commentsButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    commentsButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [commentsButton sizeToFit];
    [commentsButton addTarget:self action:@selector(touchCommentsButton:) forControlEvents:UIControlEventTouchUpInside];
    commentsButton.frame = CGRectMake(halfOffset * 0.7 , self.totalHeight - 6, commentsButton.bounds.size.width, commentsButton.bounds.size.height);
    [scrollView addSubview:commentsButton];
    
    CGRect dateLabelRect = CGRectMake(2*middleOffset + commentsButton.bounds.size.width, self.totalHeight, 10, 10);
    UILabel * dateLabel = [[UILabel alloc]initWithFrame:dateLabelRect];
    dateLabel.textColor = [UIColor darkGrayColor];
    dateLabel.font = [UIFont systemFontOfSize:12];
    dateLabel.text = @"25 апреля в 08:26";
    [dateLabel sizeToFit];
    [scrollView addSubview:dateLabel];
    self.totalHeight += commentsButton.bounds.size.height;
    
    float imageHeight = 200.0f;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.totalHeight, self.view.bounds.size.width, imageHeight)];
    imageView.image = self.image;
    [scrollView addSubview:imageView];
    self.totalHeight += imageView.bounds.size.height;
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(offset * 0.3, self.totalHeight, self.view.bounds.size.width - 0.6 * halfOffset, 0)];
    
    textView.text = [NSString stringWithFormat:@"\t%@", self.text];
    textView.font = [UIFont systemFontOfSize:14];
    textView.userInteractionEnabled = NO;
    
    CGFloat height = [self textViewHeightForAttributedText:textView.attributedText andWidth:textView.frame.size.width];
    
    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, textView.frame.size.width, height);
    [scrollView addSubview:textView];
    [textView sizeToFit];
    self.totalHeight += textView.frame.size.height + 3 * offset;
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.totalHeight);
    [self.view addSubview:scrollView];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

-(void)touchCommentsButton:(UIButton *)sender
{
    CommentsViewController * commentsViewController = [[CommentsViewController alloc] init];
    [self.navigationController pushViewController:commentsViewController animated:YES];
}

@end
