//
//  Comment.h
//  DevBy
//
//  Created by Anastasia on 5/1/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

//@property(nonatomic, assign)int type;   //?
@property(nonatomic, strong)NSString * username;
@property(nonatomic, strong)NSString * date;
@property(nonatomic, strong)NSString * comment;
//@property(nonatomic, strong)NSString * jobExperience;   //none
//@property(nonatomic, strong)NSString * rating;      //none

@property(nonatomic, strong)UIColor * color;
@property(nonatomic, assign)NSInteger level;

@end
