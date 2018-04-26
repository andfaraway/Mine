
//
//  UIView+Extension.m
//  Mine
//
//  Created by libin on 2017/12/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "UIView+LExtension.h"

@implementation UIView (LExtension)


- (void)setXx:(CGFloat)xx{
    CGRect rect = self.frame;
    rect.origin.x = xx;
    self.frame = rect;
}

- (CGFloat)xx{
    return self.frame.origin.x;
}

- (void)setYy:(CGFloat)yy{
    CGRect rect = self.frame;
    rect.origin.y = yy;
    self.frame = rect;
}

- (CGFloat)yy{
    return self.frame.origin.y;
}

- (void)setWwidth:(CGFloat)wwidth{
    CGRect rect = self.frame;
    rect.size.width = wwidth;
    self.frame = rect;
}

- (CGFloat)wwidth{
    return self.frame.size.width;
}

- (void)setHheight:(CGFloat)hheight{
    CGRect rect = self.frame;
    rect.size.height = hheight;
    self.frame = rect;
}

- (CGFloat)hheight{
    return self.frame.size.height;
}

- (void)setSsize:(CGSize)ssize{
    CGRect rect = self.frame;
    rect.size = ssize;
    self.frame = rect;
}

- (CGSize)ssize{
    return self.frame.size;
}


- (void)setCcenterX:(CGFloat)ccenterX{
    CGPoint point = self.center;
    point.x = ccenterX;
    self.center = point;
}


- (CGFloat)ccenterX{
    return self.center.x;
}

- (void)setCcenterY:(CGFloat)ccenterY{
    CGPoint point = self.center;
    point.y = ccenterY;
    self.center = point;
}


- (CGFloat)ccenterY{
    return self.center.y;
}

@end
