//
//  UIButton+Block.m
//  Mine
//
//  Created by libin on 17/11/16.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

@implementation UIButton (Block)
static char ActionTag;

/**  button 添加点击事件 默认点击方式UIControlEventTouchUpInside  */
- (void)addAction:(ButtonBlock)block {
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

/**  button 添加事件   @param controlEvents 点击的方式  */
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, &ActionTag, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}

/**  button 事件的响应方法  */
- (void)action:(id)sender {
    ButtonBlock blockAction = (ButtonBlock)objc_getAssociatedObject(self, &ActionTag);
    if (blockAction) {
        blockAction(self);
    }
}


@end
