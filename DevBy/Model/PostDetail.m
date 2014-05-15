//
//  PostDetail.m
//  DevBy
//
//  Created by Admin on 5/15/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import "PostDetail.h"

@implementation PostDetail

-(NSString * )content
{
    if (!_content)
    {
        _content = @"";
    }
    return _content;
}

@end
