//
//  UIImage+SomeFunction.m
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "UIImage+SomeFunction.h"

@implementation UIImage (SomeFunction)
+ (UIImage *)getScaleImage:(UIImage *)image toSize:(CGSize)size
{
    //压缩图片
    int iWidth  = image.size.width;
    int iHeight = image.size.height;
    if (iWidth > size.width)   // 自定义大小，想要弄多大，就弄多大
    {
        iWidth  = size.width;
        iHeight = image.size.height*iWidth/image.size.width;
        if (iHeight > size.height)
        {
            iHeight = size.height;
            iWidth  = image.size.width*iHeight/image.size.height;
        }
    }
    
    //主要在这里
    UIGraphicsBeginImageContext(CGSizeMake(iWidth, iHeight)); // 创建一个context
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, iWidth, iHeight)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)getSubImageFromImage:(UIImage *)oldImage withRect:(CGRect)rect
{
    CGImageRef imageRef = oldImage.CGImage;
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, rect);
    
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
    
    // 创建一个新图像上下文
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, rect, subImageRef);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}

+ (UIImage *)clipImage:(UIImage *)image
{
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //画圆：正切于上下文
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //设为裁剪区域
    [path addClip];
    //画图片
    [image drawAtPoint:CGPointZero];
    //生成一个新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return image;
    }
    if (kb<1) {
        return image;
    }
    
    kb*=1024;
    
    
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

/** 获取一张纯色图片  */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
