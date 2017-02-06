//
//  TTFunctions.m
//  TTUtility
//
//  Created by shine_tata on 16/9/18.
//  Copyright © 2016年 shine_tata. All rights reserved.
//

#import "TTFunctions.h"

#pragma mark - 基本数据类型

NSString * TTValidateString(id object) {
    if (!object) {
        return nil;
    }
    if (![object isKindOfClass:[NSString class]]) {
        return nil;
    }
    return object;
}

NSInteger TTValidateInteger(id object) {
    if (!object) {
        return 0;
    }
    if (![object respondsToSelector:@selector(integerValue)]) {
        return 0;
    }
    return [(NSString *)object integerValue];
}

NSDictionary * TTValidateDictionary(id object) {
    if (!object) {
        return nil;
    }
    if (![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return object;
}

NSArray * TTValidateArray(id object) {
    if (!object) {
        return nil;
    }
    if (![object isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return object;
}

CGFloat TTValidateFloat(id object) {
    if (!object) {
        return 0;
    }
    if (![object respondsToSelector:@selector(floatValue)]) {
        return 0;
    }
    return [(NSString *)object floatValue];
}

BOOL TTValidateBOOL(id object) {
    if (!object) {
        return NO;
    }
    if (![object respondsToSelector:@selector(boolValue)]) {
        return NO;
    }
    return [(NSString *)object boolValue];
}

#pragma mark - 多线程处理

void TTDispatchMainSync(TTDispatchBlock block) {
    if (!block) {
        return;
    }
    if ([NSThread isMainThread]) {
        block();
    }else{
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void TTDispatchMainAsync(TTDispatchBlock block) {
    if (!block) {
        return;
    }
    if ([NSThread isMainThread]) {
        block();
    }else{
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void TTDispatchSync(TTDispatchBlock block) {
    if (!block) {
        return;
    }
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

void TTDispatchAsync(TTDispatchBlock block) {
    if (!block) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

void TTDispatchDelay(CGFloat seconds, TTDispatchBlock block) {
    if (!block) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

#pragma mark - 屏幕适配

CGFloat TTUIScale() {
    static CGFloat scale = 0.0;
    if (fabs(scale) < 1e-6) {
        // based on iPhone 5
        CGSize designSize = CGSizeMake(320, 568);
        CGSize currentSize = [UIScreen mainScreen].bounds.size;
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            // iPad使用缩放模式，调整系数
            if (currentSize.width / 320.0 > 3) {
                // ipad pro
                currentSize = CGSizeMake(375, 667);
            } else {
                currentSize = CGSizeMake(320, 480);
            }
        }
        
        scale = (currentSize.width / designSize.width + currentSize.height / designSize.height) / 2;
    }
    return scale;
}

CGFloat TTUIRatio() {
    static CGFloat ratio = 0.0;
    if (fabs(ratio) < 1e-6) {
        // based on iPhone 5
        CGSize baseSize = CGSizeMake(320, 568);
        CGSize currentSize = [UIScreen mainScreen].bounds.size;
        
        CGFloat baseRatio = baseSize.height / baseSize.width;
        CGFloat currentRatio = currentSize.height / currentSize.width;
        ratio = baseRatio - currentRatio;
    }
    return ratio;
}
