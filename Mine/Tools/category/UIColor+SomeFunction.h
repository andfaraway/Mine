//
//  UIColor+SomeFunction.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SomeFunction)
/**
 *  16进制转uicolor
 *
 *  @param color @"#FFFFFF" ,@"OXFFFFFF" ,@"FFFFFF"
 *
 *  @return uicolor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
@end
