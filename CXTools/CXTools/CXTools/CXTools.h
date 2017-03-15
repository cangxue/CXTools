//
//  CXTools.h
//  CXTools
//
//  Created by xiaoma on 16/11/2.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 倒计时方法回调 */
typedef void(^timerRuning)(NSString *runingTime);
typedef void(^timerInvalid)(BOOL isInvalid);

@interface CXTools : NSObject


/**
 * 倒计时
 * @param timercount    倒计时总时间
 * @param timerRuning    当前运行的时间
 * @param timerInvalid  倒计时是否结束
 */
+ (void)setTimerWithTimecount:(int)timercount timerRuning:(timerRuning)timerRuning tiemrInvalid:(timerInvalid)timerInvalid;

@end
