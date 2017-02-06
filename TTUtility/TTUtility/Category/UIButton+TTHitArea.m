//
//  UIButton+TTHitArea.m
//  TTUtility
//
//  Created by shine_tata on 16/9/26.
//  Copyright © 2016年 shine_tata. All rights reserved.
//

#import "UIButton+TTHitArea.h"
#import <objc/runtime.h>

@implementation UIButton (TTHitArea)

- (void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets{
    NSValue *value = [NSValue valueWithUIEdgeInsets:hitTestEdgeInsets];
    objc_setAssociatedObject(self, @selector(hitTestEdgeInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hitTestEdgeInsets{
    NSValue *value = objc_getAssociatedObject(self, @selector(hitTestEdgeInsets));
    if (value) {
        return [value UIEdgeInsetsValue];
    }else{
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

@end
