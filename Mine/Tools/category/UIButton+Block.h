//
//  UIButton+Block.h
//  Mine
//
//  Created by libin on 17/11/16.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (Block)
/**  button 添加点击事件  */
- (void)addAction:(ButtonBlock)block;

/**  button 添加事件  controlEvents 点击的方式  */
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;


@end
