//
//  TTFunctions.h
//  TTUtility
//
//  Created by shine_tata on 16/9/18.
//  Copyright © 2016年 shine_tata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^TTDispatchBlock)();

#pragma mark - 基本数据类型的判断
/**
 判断对象是否为NSString,不是NSString返回nil

 @param object 待判断对象

 @return 结果
 */
NSString * TTValidateString(id object);

/**
 判断对象是否响应integerValue,不是数字返回0
 
 @param object 待判断对象
 
 @return 结果
 */
NSInteger TTValidateInteger(id object);

/**
 判断对象是否为NSDictionary,不是NSDictionary返回nil
 
 @param object 待判断对象
 
 @return 结果
 */
NSDictionary * TTValidateDictionary(id object);

/**
 判断对象是否为NSArray,不是NSArray返回nil
 
 @param object 待判断对象
 
 @return 结果
 */
NSArray * TTValidateArray(id object);

/**
 判断对象是否响应floatValue,不是数字返回0
 
 @param object 待判断对象
 
 @return 结果
 */
CGFloat TTValidateFloat(id object);

/**
 判断对象是否响应boolValue,不是布尔值返回NO
 
 @param object 待判断对象
 
 @return 结果
 */
BOOL TTValidateBOOL(id object);

#pragma mark - 对多线程的处理

/**
 同步dispatch，主线程

 @param block 处理block
 */
void TTDispatchMainSync(TTDispatchBlock block);

/**
 异步dispatch，主线程
 
 @param block 处理block
 */
void TTDispatchMainAsync(TTDispatchBlock block);

/**
 同步dispatch，子线程
 
 @param block 处理block
 */
void TTDispatchSync(TTDispatchBlock block);

/**
 异步dispatch，子线程
 
 @param block 处理block
 */
void TTDispatchAsync(TTDispatchBlock block);


/**
 延时处理任务，主线程

 @param seconds 延时时间
 @param block   处理block
 */
void TTDispatchDelay(CGFloat seconds, TTDispatchBlock block);

#pragma mark - 屏幕适配

/**
 获取当前手机屏幕相对于iPhone5的缩放系数

 @return 缩放系数
 */
CGFloat TTUIScale();

/**
 获取当前手机屏幕宽高比例与iPhone5宽高比例的差值

 @return 比例差值
 */
CGFloat TTUIRatio();


