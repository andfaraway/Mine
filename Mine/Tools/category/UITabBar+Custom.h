//
//  UITabBar+Custom.h
//  ComsenseHome
//
//  Created by TOUCH on 2017/3/8.
//  Copyright © 2017年 Comsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Custom)
//显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index;

//隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index;
@end
