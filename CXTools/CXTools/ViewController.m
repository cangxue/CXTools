//
//  ViewController.m
//  CXTools
//
//  Created by xiaoma on 16/11/2.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "ViewController.h"
#import "CXTools.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 倒计时
- (void)getCountdownWithTimecount {
    NSString *labelStr = @"根据日程安排，今天上午9时，十二届全国人大五次会议将在人民大会堂举行闭幕会，闭幕会将表决关于政府工作报告、年度计划、年度预算、全国人大常委会工作报告、最高人民法院工作报告、最高人民检察院工作报告的六个决议草案，民法总则草案、关于第十三届全国人大代表名额和选举问题的决定草案、香港特别行政区选举第十三届全国人大代表的办法草草草草";
    
//    self.showLabel.attributedText = [UILabel cx_labelAttributedString:labelStr lineSpacing:10];
//
//    
//    CGFloat height = [UILabel cx_labelSizeForText:labelStr font:15 width:UIScreenWidth - 32 lineSpacing:10].height;
//    
//    int row = [UILabel cx_labelGetRowForText:labelStr font:15 width:UIScreenWidth - 32 lineSpacing:10];
//    
//    NSLog(@"+++++%f=====%d",height,row);
    
    //富文本
    //NSFontAttributeName   字号 UIFont 默认12
    //NSParagraphStyleAttributeName    段落样式  NSParagraphStyle
    //NSForegroundColorAttributeName    前景色   UIColor
    //NSBackgroundColorAttributeName    背景色   UIColor
    //NSObliquenessAttributeName        字体倾斜     NSNumber
    //NSExpansionAttributeName          字体加粗     NSNumber  比例 0就是不变 1增加一倍
    //NSKernAttributeName               字间距   CGFloat
    //NSUnderlineStyleAttributeName     下划线     1或0
    //NSUnderlineColorAttributeName     下划线颜色
    //NSStrikethroughStyleAttributeName 删除线   1或0
    //NSStrikethroughColorAttributeName 某种颜色
    //NSStrokeColorAttributeName        same as ForegroundColor
    //NSStrokeWidthAttributeName        CGFloat
    //NSLigatureAttributeName           连笔字  1或0  没看出效果
    //NSShadowAttributeName             阴影    NSShawdow
    //NSTextEffectAttributeName          设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
    //NSAttachmentAttributeName         NSTextAttachment  设置文本附件,常用插入图片
    //NSLinkAttributeName               链接  NSURL (preferred) or NSString
    //NSBaselineOffsetAttributeName     基准线偏移   NSNumber
    
    //NSWritingDirectionAttributeName   文字方向     @[@(1),@(2)]  分别代表不同的文字出现方向等等，我想你一定用不到它 - -
    //NSVerticalGlyphFormAttributeName  水平或者竖直文本  1竖直 0水平 在iOS没卵用，不支持竖版
    
    NSParagraphStyle *paragraph = [[NSParagraphStyle alloc]init];
    NSMutableParagraphStyle *muParagraph = [[NSMutableParagraphStyle alloc]init];
    muParagraph.lineSpacing = 10; // 行距
    muParagraph.paragraphSpacing = 20; // 段距
    muParagraph.firstLineHeadIndent = 30; // 首行缩进
    
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[[NSString stringWithFormat:@"%@", labelStr] dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    
    NSRange range = NSMakeRange(0, 5);
    // 设置字体大小
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:range];
    //字间距
    [attrStr addAttribute:NSKernAttributeName value:@(2) range:range];
    // 字体倾斜
    [attrStr addAttribute:NSObliquenessAttributeName value:@(1) range:range];
    // 字体加粗
    [attrStr addAttribute:NSExpansionAttributeName value:@(0.5) range:range];
    // 下划线
    [attrStr addAttribute:NSUnderlineStyleAttributeName value:@(1) range:range];
    [attrStr addAttribute:NSUnderlineColorAttributeName value:[UIColor blueColor] range:range];
    // 删除线
    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attrStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor greenColor] range:range];
    
    // 连体字
    [attrStr addAttribute:NSLigatureAttributeName value:@(1) range:range];
    
    
    // 设置颜色
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.942 green:0.611 blue:0.771 alpha:1.000] range:range];
    // 背景色
    [attrStr addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:0.475 green:0.482 blue:0.942 alpha:1.000] range:range];
    
    // stroke
    [attrStr addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:range];
    [attrStr addAttribute:NSStrokeWidthAttributeName value:@(2) range:range];
    
    // 设置段落样式
    [attrStr addAttribute:NSParagraphStyleAttributeName value:muParagraph range:range];
    
    // 文本方向
    [attrStr addAttribute:NSVerticalGlyphFormAttributeName value:@(1) range:range];
    [attrStr addAttribute:NSWritingDirectionAttributeName value:@[@(2),@(3)] range:range];
    
    
    // 阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(2, 2);
    shadow.shadowColor = [UIColor orangeColor];
    shadow.shadowBlurRadius = 1;
    [attrStr addAttribute:NSShadowAttributeName value:shadow range:range];
    
    // 链接
    [attrStr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.jianshu.com/p/8f49c9c99b21"] range:range];
    
    // 文字中加图片
    NSTextAttachment *attachment=[[NSTextAttachment alloc] initWithData:nil ofType:nil];
    
    UIImage *img=[UIImage imageNamed:@"test.png"];
    attachment.image=img;
    attachment.bounds=CGRectMake(0, 0, 20, 20);
    [attrStr addAttribute:NSAttachmentAttributeName value:attachment range:range];
    
    // 基准线偏移
    [attrStr addAttribute:NSBaselineOffsetAttributeName value:@(50) range:range];
    
    self.showLabel.attributedText = attrStr;
    
}
- (void)getLabeRow {
    
}


- (IBAction)clickAction:(id)sender {
    
    [self getCountdownWithTimecount];
}

@end
