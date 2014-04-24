//
//  StandardJobCell.m
//  DevBy
//
//  Created by Anastasia on 4/22/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "StandardJobCell.h"

@interface StandardJobCell()

@property(nonatomic, assign, readwrite)float totalHeight;

@end

@implementation StandardJobCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawCell{}

@end
