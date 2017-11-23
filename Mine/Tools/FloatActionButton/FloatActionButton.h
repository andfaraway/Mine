//
//  BaseTools.m
//  Mine
//
//  Created by libin on 17/11/23.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FloatActionButton : UIButton
@property (nonatomic, copy) void(^floatBtnClickBlock)();

@end
