//
//  UIColor+Extras.m
//  ChartsDemo
//
//  Created by Rupam Mitra on 31/07/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

#import "UIColor+Extras.h"

@implementation UIColor (Extras)

+ (UIColor *)randomColor
{
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}

@end
