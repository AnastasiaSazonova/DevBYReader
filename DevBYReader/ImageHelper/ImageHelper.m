//
//  ImageHelper.m
//  PicturesInRects
//
//  Created by Admin on 4/16/14.
//  Copyright (c) 2014 Eugeny Hil. All rights reserved.
//

#import "ImageHelper.h"

@interface ImageHelper ()

- (UIImage *)getSubImageFrom:(UIImage *)image WithRect:(CGRect)rect;

@end

@implementation ImageHelper

- (UIImage *)getRectImageFrom:(UIImage *)image
{
    UIImage *rectImage;
    CGFloat imgWidth = image.size.width;
    CGFloat imgHeight = image.size.height;
    CGFloat margin = fabsf(imgWidth - imgHeight) / 2;
    
    if(imgWidth > imgHeight)
        rectImage = [self getSubImageFrom:image WithRect:CGRectMake(margin, 0, imgWidth - (margin * 2), image.size.height)];
    else if(imgWidth < imgHeight)
        rectImage = [self getSubImageFrom:image WithRect:CGRectMake(0, margin, imgWidth, imgHeight - (margin * 2))];
    
    return rectImage;
}

- (UIImage *)getSubImageFrom:(UIImage *)image WithRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //translated rectangle for the image context
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, image.size.width, image.size.height);
    
    //clip to the bounds of the image context
    //not strictly neccessary as it will get clipped anyway?
    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    
    //draw image
    [image drawInRect:drawRect];
    
    UIImage *subImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return subImage;
}

@end
