//
//  CustomCell.h
//  DevBy
//
//  Created by Anastasia on 5/2/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>
//abstract class
typedef NS_ENUM(NSUInteger, CustomCellType)
{
    articleCellType,
    mainArticleCellType,
    eventCellType,
    premiumJobCellType,
    middleJobCellType,
    standardJobCellType,
    commentCellType,
    feedBackCellType
};

@interface CustomCell : UITableViewCell

+(CustomCell *)customCellWithType:(CustomCellType)type;
-(void)drawCell;
-(void)drawCellWithOffset:(int)offset;

@end
