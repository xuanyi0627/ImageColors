//
//  UIColor+Convert.h
//  ImageColors
//
//  Created by Echo on 16/6/4.
//  Copyright © 2016年 LiuXuanyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Convert)

-(CGFloat)Hue;
-(CGFloat)Saturation;
-(CGFloat)Brightness;
-(NSString *)hexStringFromColor;

@end
