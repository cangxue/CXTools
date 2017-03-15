//
//  CXTools.m
//  CXTools
//
//  Created by xiaoma on 16/11/2.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "CXTools.h"

@implementation CXTools

/**
 * 倒计时
 * @param timercount  倒计时总时间
 * @param timerRuning  当前运行的时间
 * @param timerInvalid  倒计时是否结束
 */

+ (void)setTimerWithTimecount:(int)timercount timerRuning:(timerRuning)timerRuning tiemrInvalid:(timerInvalid)timerInvalid {
    __block int timeout = timercount - 1;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                timerInvalid(YES);
            });
        }else{
            int seconds = timeout % timercount;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                timerRuning(strTime);
            });
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
}

@end
