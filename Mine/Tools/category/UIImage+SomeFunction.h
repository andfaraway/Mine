//
//  UIImage+SomeFunction.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SomeFunction)
/** 等比缩放图片到指定大小  */
+ (UIImage *)getScaleImage:(UIImage *)image toSize:(CGSize)size;

/** 截取图中某部分小图  */
+ (UIImage *)getSubImageFromImage:(UIImage *)oldImage withRect:(CGRect)rect;

/** 裁剪圆形图片 例如：头像 */
+ (UIImage *)clipImage:(UIImage *)image;

/**  压缩图片到指定大小kb */
+(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;

/** 获取一张纯色图片  */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
