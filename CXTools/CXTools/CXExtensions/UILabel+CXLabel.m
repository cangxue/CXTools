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
 * 无行间距
 */
+ (CGSize)cx_labelSizeForText:(NSString *)text font:(CGFloat)fontSize width:(CGFloat)width {
//    UIFont * font = [UIFont systemFontOfSize:fontSize];
//    NSDictionary * dict =[[NSDictionary alloc]initWithObjectsAndKeys:font,NSFontAttributeName, nil];
//    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
//    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
    
    CGSize size = [self cx_labelSizeForText:text font:fontSize width:width lineSpacing:0];
    
    return size;
}

/*
 * 计算labeltext的size
 * 有间距
 */
+ (CGSize)cx_labelSizeForText:(NSString *)text font:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    UIFont * font = [UIFont systemFontOfSize:fontSize];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineSpacing = lineSpacing;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle,NSKernAttributeName:@0.0f
                          };
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size;
}

/*
 * 设置行间距
 */
+ (NSMutableAttributedString *)cx_labelAttributedString:(NSString *)text lineSpacing:(CGFloat)spacing {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = spacing;
    
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text attributes:dic];
    
    return attributeStr;
}

/*
 * 获取字符串行数
 */
+ (int)cx_labelGetRowForText:(NSString *)text font:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    int row;
    CGFloat height = [self cx_labelSizeForText:text font:15 width:width lineSpacing:lineSpacing].height;
    
    row = floor((height + lineSpacing)/(fontSize + 3 + lineSpacing)) + 1;
    
    return row;
}

@end
