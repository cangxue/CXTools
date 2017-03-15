//
//  UILabel+CXLabel.h
//  CXAlertView
//
//  Created by xiaoma on 17/3/10.
//  Copyright © 2017年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CXLabel)

/*
 * 计算labeltext的size
 */
+ (CGSize)cx_labelSizeForText:(NSString *)text font:(CGFloat)fontSize width:(CGFloat)width;

/*
 * 设置行间距
 */
+ (NSMutableAttributedString *)cx_labelAttributedString:(NSString *)text lineSpacing:(CGFloat)spacing;


@end