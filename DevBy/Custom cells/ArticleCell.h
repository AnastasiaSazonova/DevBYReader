//
//  ArticleCell.h
//  DevBy
//
//  Created by Anastasia on 4/11/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell

<<<<<<< HEAD
@property(nonatomic, assign, readonly)float totalHeight;

=======
>>>>>>> sazonova
@property(nonatomic, strong)NSString * title;
@property(nonatomic, strong)NSString * date;
@property(nonatomic, strong)UIImage * image;
@property(nonatomic, assign)float height;

-(void)drawCell;

@end
