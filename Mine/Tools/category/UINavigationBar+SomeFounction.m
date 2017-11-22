//
//  UINavigationBar+SomeFounction.m
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "UINavigationBar+SomeFounction.h"

@implementation UINavigationBar (SomeFounction)
// 显示导航栏下面的分割线
- (void)showNavigationBarBottomLineView {
    [self setShadowImage:nil];
}

// 隐藏导航栏下面的分割线
- (void)hiddenNavigationBarBottomLineView {
    [self setShadowImage:[[UIImage alloc] init]];
}

@end
