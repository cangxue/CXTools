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
    NSString *labelStr = @"根据日程安排，今天上午9时，十二届全国人大五次会议将在人民大会堂举行闭幕会，闭幕会将表决关于政府工作报告、年度计划、年度预算、全国人大常委会工作报告、最高人民法院工作报告、最高人民检察院工作报告的六个决议草案，民法总则草案、关于第十三届全国人大代表名额和选举问题的决定草案、香港特别行政区选举第十三届全国人大代表的办法草案、澳门特别行政区选举第十三届全国人大代表的办法草案、关于确认全国人大常委会接受徐显明辞去第十二届全国人大常委会委员职务的请求的决定草案。";
    
    self.showLabel.attributedText = [UILabel cx_labelAttributedString:labelStr lineSpacing:10];

    
    CGFloat height = [UILabel cx_labelSizeForText:labelStr font:15 width:UIScreenWidth - 32 lineSpacing:10].height;
    
    NSLog(@"+++++%f",height);
}


- (IBAction)clickAction:(id)sender {
    
    [self getCountdownWithTimecount];
}

@end
