//
//  MainArticleCell.h
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainArticleCell : UITableViewCell

@property(nonatomic, strong)NSString * title;
@property(nonatomic, strong)NSString * imageUrl;
@property(nonatomic, assign)float height;

-(void)drawCell;

@end
