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
    [CXTools setTimerWithTimecount:60 timerRuning:^(NSString *runingTime) {
        
         self.showLabel.text = [NSString stringWithFormat:@"倒计时%@S",runingTime];
    } tiemrInvalid:^(BOOL isInvalid) {
        self.showLabel.text = @"倒计时结束";
    }];
}

- (IBAction)clickAction:(id)sender {
    
    [self getCountdownWithTimecount];
}

@end
