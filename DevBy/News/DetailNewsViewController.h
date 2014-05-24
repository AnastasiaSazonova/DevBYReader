//
//  DetailNewsViewController.h
//  DevBy
//
//  Created by Anastasia on 5/24/14.
//  Copyright (c) 2014 AD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNewsViewController : UIViewController

@property(nonatomic, strong)NSString * url;

- (id)initWithUrl:(NSString*)url date:(NSString *)date;

@end
