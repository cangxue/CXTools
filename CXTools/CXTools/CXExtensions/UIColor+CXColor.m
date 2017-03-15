//
//  UIColor+CXColor.m
//  CXAlertView
//
//  Created by xiaoma on 17/3/10.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "UIColor+CXColor.h"

@implementation UIColor (CXColor)
/*
 * 16进制颜色处理
 */
+ (UIColor *)cx_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float) ((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float) ((hexValue & 0xFF00) >> 8)) / 255.0
                            blue:((float) (hexValue & 0xFF)) / 255.0
                           alpha:alphaValue];
}

+ (UIColor *)cx_colorWithHex:(NSInteger)hexValue {
    return [UIColor cx_colorWithHex:hexValue alpha:1.0];
}

@end
