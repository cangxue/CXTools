//
//  UILabel+CXLabel.m
//  CXAlertView
//
//  Created by xiaoma on 17/3/10.
//  Copyright © 2017年 CX. All rights reserved.
//

#import "UILabel+CXLabel.h"

@implementation UILabel (CXLabel)
/*
 * 计算labeltext的size
 */
+ (CGSize)cx_labelSizeForText:(NSString *)text font:(CGFloat)fontSize width:(CGFloat)width {
    UIFont * font = [UIFont systemFontOfSize:fontSize];
    NSDictionary * dict =[[NSDictionary alloc]initWithObjectsAndKeys:font,NSFontAttributeName, nil];
    CGRect  rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
    return size;
}

/*
 * 设置行间距
 */
+ (NSMutableAttributedString *)cx_labelAttributedString:(NSString *)text lineSpacing:(CGFloat)spacing {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    return attributedString;
}

@end
