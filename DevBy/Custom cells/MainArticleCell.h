//
//  MainArticleCell.h
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface MainArticleCell : CustomCell

@property(nonatomic, strong)NSString * title;
@property(nonatomic, strong)UIImage * image;
@property(nonatomic, assign)float height;

@end
