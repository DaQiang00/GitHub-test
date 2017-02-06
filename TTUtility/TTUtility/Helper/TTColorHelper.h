//
//  TTColorHelper.h
//  TTUtility
//
//  Created by shine_tata on 16/9/26.
//  Copyright © 2016年 shine_tata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface TTColorHelper : NSObject

// color
+ (UIColor *)colorWithString:(NSString *)theString;
+ (NSString *)stringWithColor:(UIColor *)color;

@end
