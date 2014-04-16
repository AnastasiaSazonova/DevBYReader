//
//  CommentsTableView.h
//  DevBy
//
//  Created by Anastasia on 4/14/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsTableView : UITableView

@property(nonatomic, strong)NSArray * comments;

@property(nonatomic, assign)float tableHeight;

- (id)initWithFrame:(CGRect)frame comments:(NSArray *)comments;

@end
