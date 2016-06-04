//
//  UIColor+Convert.m
//  ImageColors
//
//  Created by Echo on 16/6/4.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

#import "UIColor+Convert.h"

@implementation UIColor (Convert)

-(CGFloat)Hue {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return hue;
}

-(CGFloat)Saturation {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return saturation;
}

-(CGFloat)Brightness {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return brightness;
}

-(NSString *)hexStringFromColor
{
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

@end
