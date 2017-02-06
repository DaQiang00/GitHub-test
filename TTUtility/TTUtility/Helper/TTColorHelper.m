//
//  TTColorHelper.m
//  TTUtility
//
//  Created by shine_tata on 16/9/26.
//  Copyright © 2016年 shine_tata. All rights reserved.
//

#import "TTColorHelper.h"

@implementation TTColorHelper

+ (UIColor *)colorWithString:(NSString *)theString{
    UIColor *color = nil;
    
    if (theString != nil){
        NSScanner *scanner = [NSScanner scannerWithString:theString];
        unsigned int hexNumber = 0;
        BOOL success = [scanner scanHexInt:&hexNumber];
        
        if (success){
            int blue = hexNumber & 0x0000ff;
            int green = (hexNumber >> 8) & 0x0000ff;
            int red = (hexNumber >> 16) & 0x0000ff;
            
            color = [UIColor colorWithRed:red / 255.0
                                    green:green / 255.0
                                     blue:blue / 255.0
                                    alpha:1];
        }else{
            NSLog(@"Invalid color parameter");
        }
    }
    return color;
}

+ (NSString *)stringWithColor:(UIColor *)color{
    CGFloat red, green, blue, alpha;
    
    UIColor *theColor = color;
    
#if TARGET_OS_IPHONE
#elif TARGET_OS_MAC
    theColor = [theColor colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
#endif
    
    [theColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    red *= 255.0;
    green *= 255.0;
    blue *= 255.0;
    int value = blue;
    
    value += (int)(green + 0.5) << 8;
    value += (int)(red + 0.5) << 16;
    
    return [NSString stringWithFormat:@"%06X", value];
}


@end
