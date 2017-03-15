//
//  UIColor+CXColor.h
//  CXAlertView
//
//  Created by xiaoma on 17/3/10.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * RGB颜色处理
 */
#define CCC(_R_,_G_,_B_) [UIColor colorWithRed:(float)(_R_/255.0f) green:(float)(_G_ / 255.0f) blue:(float)(_B_ / 255.0f) alpha:1.0f]
/*
 * 16进制颜色处理
 */
#define CCCHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface UIColor (CXColor)

/*
 * 16进制颜色处理，可设置alph值
 */
+ (UIColor *)cx_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor *)cx_colorWithHex:(NSInteger)hexValue;

@end
