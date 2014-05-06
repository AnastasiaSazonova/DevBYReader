//
//  MenuViewController.m
//  Dev
//
//  Created by Mraks on 4/9/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "NewsViewController.h"
#import "SlideViewController.h"


@interface NewsViewController()  <UITableViewDataSource,UITableViewDelegate, SlideViewDelegate> 

@property(nonatomic, strong)UITableView* newsTableView;

@end

@implementation NewsViewController 
{
    NSMutableArray* contentArray;
}
@synthesize newsTableView;

- (id)init {
    self = [super init];
    if (self) 
    {
    }
    return self;
}

- (void)menuPress
{
    NSLog(@"IT work");
}

- (void)showNext
{
    UIViewController* controller = [[UIViewController alloc]init];
    [controller.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController pushViewController: controller animated:YES];
}
       
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    contentArray = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];

    newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    newsTableView.dataSource = self;
    newsTableView.delegate = self;
    
    [self.view addSubview:newsTableView];
    
//    [self performSelector:@selector(showNext) withObject:nil afterDelay:0.5];
}

#pragma mark - SlideViewController Delegate
-(NSInteger)countForPage
{
    return  [contentArray count];
}

-(NSString*) contentByIndex:(NSInteger)index
{
    if (index > [contentArray count] -1)
    {
        return nil;
    }
    return [contentArray objectAtIndex:index];
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [contentArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SlideViewController* slideViewController = [[SlideViewController alloc]initWithIndex:indexPath.row];
    slideViewController.delegate = self;
    [self.navigationController pushViewController:slideViewController animated:YES];
}

#pragma mark - device orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

